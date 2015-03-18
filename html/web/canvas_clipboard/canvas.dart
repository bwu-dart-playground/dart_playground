library x;

import 'dart:html';
import 'dart:mirrors';
import 'package:polymer/polymer.dart';


/**
 * example from http://stackoverflow.com/questions/17916968
 * How can I paste an image from the clipboard onto a Canvas element using Dart?
 */

@CustomTag('my-canvas')
class MyCanvas extends PolymerElement {
  MyCanvas.created() : super.created();

  @observable bool test = true;

  @override
  void attached() {
    super.attached();

    document.onPaste.listen((data) => onData(data), onDone: () => onDone(null));
    ($['canvas'] as CanvasElement).onPaste.listen((data) =>onData(data), onDone: () => onDone(null));
    ($['canvas'] as CanvasElement).onBeforePaste.listen((data) => print('before' + data));
    this.onPaste.listen((data) => onData(data), onDone: () => onDone(null));
    this.onKeyDown.listen((data) => keyDown(data));

    //Element p = new Element.tag('form', 'my-login');
//    Element p = new Element.tag('my-login', 'FormElement');
//    p.attributes['p']='p';
//    this.children.add(p);

    Element y = new Element.tag('form', 'my-login');
    this.children.add(y);
    y.attributes['y']='y';

//    var z = document.createElement('form', 'my-login');

//    if(p.xtag is MyLogin) {
//      print('FormElement');
//    }

//    var alice = new RtcPeerConnection(
//        {"iceServers": [{"url": "stun:stun.l.google.com:19302"}]}
//    );
//
//    var bob = new RtcPeerConnection(
//        {"iceServers": [{"url": "stun:stun.l.google.com:19302"}]}
//    );
//
//    alice.createDataChannel("somelablel", {});
//
//    alice.onNegotiationNeeded.listen((var data){
//      alice.createOffer({}).then((var offer){
//        //got offer
//        alice.setLocalDescription(offer);
//        bob.setRemoteDescription(offer);
//      });
//    });
//
//    bob.onIceCandidate.listen((evt) {
//        if (evt.candidate)
//            print(evt.cancelable);
//        });
//
//    alice.onIceCandidate.listen((evt) {
//        if(evt.candidate != null)
//            //TODO: add iceCandidate to Bob
//          bob.addIceCandidate(evt.candidate, () => print('void: $evt'), (var x) => print('FailureCallback: $evt'));
//    });

  }

  void keyDown(KeyboardEvent e) {
   // if(e.keyCode == 17)
  }

  void onData(Event data) {
    print(data);

    //print(data.clipboardData.items
    //print(data.clipboardData.items[1]);
    var files = data.clipboardData.getData('Files');
    var text = data.clipboardData.getData('text/html');
    var text2 = data.clipboardData.getData('Text');
    var text3 = data.clipboardData.getData('text/plain');
    var url = data.clipboardData.getData('url');
    var url2 = data.clipboardData.getData('URL');

    //print(data.clipboardData.files[0]);

    var m = reflect(data.clipboardData.getData('Files'));
    //m.invoke(new Symbol('__getter__'), [1], null);

    var textx = data.clipboardData.items;
    //var blob = data.clipboardData.items[1].
    print(textx[0].kind);
    if(textx[0].kind == "string") {
      textx[0].getAsString().then((Event value) => print('xxx: ${value.clipboardData}'));
    } else if (textx[0].kind == "file") {
      print('file');
      Blob b = textx[0].getAsFile();
      FileReader reader = new FileReader();
      reader.onLoad.listen((e) {
        ImageElement img = new ImageElement()
        ..src = (e.target as FileReader).result;
        img.onLoad.listen((e) {
          (($['canvas'] as CanvasElement).getContext('2d') as CanvasRenderingContext2D).drawImage(img, 0, 0);
        });
      });
      reader.readAsDataUrl(b);
      print(textx[0].getAsFile().toString());
      print(textx[0].getAsFile().size);
      print(textx[0].getAsFile().type);
    }
  }

  void onDone(e) {
    print(e);
  }

  String toString() => 'MyCanvas';
}