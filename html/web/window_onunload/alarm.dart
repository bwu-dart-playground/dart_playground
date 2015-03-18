
import 'dart:html';
//import 'package:mdv/mdv.dart' as mdv;

void main() {
  window.onUnload.listen((BeforeUnloadEvent e) {
    print('hallo');
    print('xxx');
    //e.returnValue = "";
    //e.preventDefault();
    //return "";
  });


  window.onPageHide.listen((BeforeUnloadEvent e) {
    print('zzz');
    print('ttt');
    //e.returnValue = "";
    //e.preventDefault();
    //return "";
  });


  //mdv.initialize();
}