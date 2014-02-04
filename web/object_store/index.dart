import 'dart:html';
import 'dart:async';
import 'dart:indexed_db' as idb;
import 'dart:convert';

// Example from: https://gist.github.com/nolanlawson/8330172

// toggle true/false in order to confirm that IE
// only bars when we're using complex keys
var useComplexKeys = true;

void main() {

  window.indexedDB.open('MyTestdatabase', version: 1,
      onUpgradeNeeded: (idb.VersionChangeEvent e) {
        print('OnUpgradeNeeded1: ${e.toString()}');
        idb.Database db = (e.target as idb.OpenDBRequest).result;
        idb.ObjectStore objectStore = db.createObjectStore('persons', keyPath: 'name');
      },
      onBlocked: (e) {
        print('Blocked: $e');
        ((e.target as idb.OpenDBRequest).result as idb.Database).close();
      })
      .then((idb.Database db) {
        if(!db.objectStoreNames.contains('persons')) {
          window.indexedDB.open('MyTestdatabase', version: 2,
              onUpgradeNeeded: (idb.VersionChangeEvent e) {
                print('OnUpgradeNeeded2: ${e.toString()}');
                idb.Database db = (e.target as idb.OpenDBRequest).result;
                idb.ObjectStore objectStore = db.createObjectStore('persons', keyPath: 'name');
              },
              onBlocked: (idb.VersionChangeEvent e) {
                print('Blocked2: $e; NewVersion: ${e.newVersion}');
              })
              .then(addPerson,
                  onError: (e) {
                    print('Error2: $e');
                  });
        } else {
          addPerson(db);
        }
      },
      onError: (Event e) {
        print('Error - Traget: ${e.currentTarget}, ${e}');
        window.indexedDB.deleteDatabase('MyTestdatabase');
        ((e.target as idb.OpenDBRequest).result as idb.Database).close();
    });
}


var persons;

void addPerson(idb.Database db) {
  print('addPerson');
  if(useComplexKeys) {
    persons = [
                   {'name': ['complex', 'key']},
                   {'name': ['very complex', 'key', 1]},
                   {'name': ['very complex', 'key', 2]},
                   {'name': ['very complex', 'key', 3]},
                   {'name': ['very complex', 'key', 'foo']}
                   ];
  } else {
    persons = [
               {'name': 'foo'},
               {'name': 'bar'},
               {'name': 'baz'},
               {'name': 'quux'},
               {'name': 'foobar'}
    ];
  }

  idb.Transaction transaction = db.transaction('persons', 'readwrite');
  idb.ObjectStore objectStore = transaction.objectStore('persons');

  int numDone = 0;
  bool gotError = false;

  transaction.onComplete.listen((e) => checkDone(db, numDone));

  persons.forEach((person) {
    if (gotError) {
      return;
    }

    try {
      var addRequest = objectStore.add(person)
      .then((onValue) {
        numDone++;
        //checkDone(db, numDone);
      }, onError: ((event) {
        // duplicate key error, already added these objects
        if (!gotError) {
          //queryDB(db);
          print('got an expected error: ${event.target.error}');
        }
        gotError = true;
      }));
    } catch (err) {
      print('got an unexpected error: $err');
    } finally {
      //db.close();
    }
  });
}

void queryDB(idb.Database db) {
  var transaction = db.transaction(['persons'], 'readonly');
  var objectStore = transaction.objectStore('persons');
  var keyRange =  new idb.KeyRange.lowerBound(useComplexKeys ? ['very complex', 'key'] : 'foo');
  var cursorRequest = objectStore.openCursor(range: keyRange);
  var people = [];
  cursorRequest.listen((idb.CursorWithValue event) {
    var result = event.value;
    if (result == null) { // done
      print('people are: ' + JSON.encode(people));
      return;
    }
    people.add(result);
    event.advance(1);
  });
}


void checkDone(idb.Database db, int numDone) {
  if (numDone == persons.length) {
    queryDB(db);
  }
}


