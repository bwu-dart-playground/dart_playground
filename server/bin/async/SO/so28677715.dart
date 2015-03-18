import 'dart:async' show Future, Stream, Completer;
import 'dart:io' show Directory, File;

void main() {}

Directory userDirectory;
String globalPathOfDirectoryToCopy;
List<String> split(String str) => [''];

//Future<Directory> createCopyDirectory(Directory directoryToCreate) {
//  //Completer completer = new Completer();
//  /* return */
//  return directoryToCreate.create().then((directory) {
//    String userID = split(userDirectory.path).last;
//    Directory contentToCopy = new Directory(globalPathOfDirectoryToCopy);
//    List<Future> creatingContent = new List<Future>();
//    return contentToCopy
//        .list(recursive: true, followLinks: false)
//        .forEach((File f) {
//      if (f is File) {
//        File fileToCreate = new File(f.path.replaceFirst('pages', userID));
//        creatingContent.add(fileToCreate.create(recursive: true).then((_) {
//          return f.readAsString().then((fileContent) {
//            return fileToCreate.writeAsString(fileContent);
//          });
//        }));
//      }
//    }).then((_) {
//      return Future.wait(creatingContent).then((_) {
//        // completer.complete(directoryToCreate);
//        return directoryToCreate;
//      });
//    });
//  });
//  //return completer.future;
//}

Future<Directory> createCopyDirectory(Directory directoryToCreate) {
  Completer<Directory> completer = new Completer<Directory>();
  directoryToCreate.create().then((directory) {
    String userID = split(userDirectory.path).last;
    Directory contentToCopy = new Directory(globalPathOfDirectoryToCopy);
    List<Future> creatingContent = new List<Future>();
    contentToCopy.list(recursive: true, followLinks: false).forEach((f) {
      if (f is File) {
        File fileToCreate = new File(f.path.replaceFirst('pages', userID));
        creatingContent.add(fileToCreate.create(recursive: true).then((_) {
          return f.readAsString().then((fileContent) {
            return fileToCreate.writeAsString(fileContent);
          });
        }));
      }
    }).then((_) => Future
        .wait(creatingContent)
        .then((_) => completer.complete(directoryToCreate)));
  });
  return completer.future;
}
