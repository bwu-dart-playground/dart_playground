import 'dart:io';
import 'dart:async' show Future;

abstract class BinData {

  Future<int> readByte();

  Future<String> readNullString() {
    var buffer = new StringBuffer();
    int char;

    return Future.doWhile(() {
      return readByte().then((char) {
        if (char == 0) {
          return false;
        }
        buffer.writeCharCode(char);
        return true;
      });
    }).then((_) => buffer.toString());
  }
}


class Parser {
  BinData _data;

  void load(BinData data){
     //...
  }
}

class FileBinData extends BinData {
  RandomAccessFile _file;

  FileBinData.from(RandomAccessFile file){
    this._file = file;
  }

  int readByte(){
    return this._file.readByteSync();
  }
}

class WebFileBinData extends BinData {
  File _file;
  int _position = 0;

  WebFileBinData.from(File file){
    this._file = file;
  }

  Future<int> readByte() async {
    Blob blob = _file.slice(_position, _position + 1);

    FileReader reader = new FileReader();

    return reader.onLoad.map((e)=>reader.result).first
        .then((e) {

      return reader.readAsArrayBuffer(blob);
      //...
    });

    //...
  }
}
