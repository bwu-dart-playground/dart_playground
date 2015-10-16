import 'dart:async' show Future, Stream;

import 'package:couchclient/couchclient.dart';
import 'package:sqljocky/sqljocky.dart';

void main() {
  newEntry(new Session());
}
Future<List<int>> newEntry(Session session) {
    bool success = true;
    List<int> error = Helpers.formatJsonAndEncodeUtf8(
    "ERROR 3623231 (Experiencebox could not be saved )", session: session);
    Future coucheFutureQuerySave = new Future(() {
      new Couchbase().couchConnExperiencebox.set(uniqueId, UTF8.encode(
          documentOriented.toString())).catchError((error) {
        print("COUCHEBASE ERROR 338420: " + error.toString());
        success = false;
      });
    }).catchError((error) {
      print("COUCHEBASE ERROR 338121: " + error.toString());
      success = false;
    });

    // Save data to MySql Database
    //create archiv entry
    Future <Results> mysql = mysqlCon.query(
        getQuery()).catchError((error) {
      print("failed archive");
      success = false;
    }).whenComplete((){
      print("completed archive");
      //querystring for insert word
      String wordQuery = new Tag().getInsertWordIfNotExists(tags);
      return mysqlCon.query( wordQuery ).catchError((error) {
        print("failed word");
        success = false;
      }).whenComplete((){
        print("completed word");
        //query string for insert tags in blog
        String tagQuery = new Tag().getInsertTagsInBlogIfNotExists(tags, uniqueId);
        return mysqlCon.query( tagQuery ).catchError((error) {
          print("failed tag in blog");
          success = false;
        });
      });
    });
    return Future.wait([mysql, coucheFutureQuerySave]).then((e) {
      // Save data to CoucheBase
      if (success) {
        print("completed all");
        return Helpers.formatJsonAndEncodeUtf8('OK', session: session, data:
            [new JsonObject.fromJsonString('{"id":"' + uniqueId + '"}')]);
      } else {
        print("failed");
        success = false;
      }
    });
}
