// Copyright (c) 2013, polymer_behavior project authors. Please see
// the AUTHORS file for details. All rights reserved. Use of this source code is
// governed by a BSD-style license that can be found in the LICENSE file.

library polymer_behavior.nohover_onscroll;

//import 'dart:async' show StreamSubscription, Timer;
import 'dart:html' as dom;
import 'package:polymer/polymer.dart' show CustomTag, override, observable, PolymerElement, published, toObservable,
  ChangeNotifier, reflectable; // TODO remove ChangeNotifier, reflectable when bug is solved

@CustomTag('my-file-list')
class MyFileList extends PolymerElement {
  MyFileList.created() : super.created() {
    print(myname);
  }

  @observable String aPattern = r"\w{2,}";

  @observable List<dom.File> files = toObservable([]);

  //@observable String myname = new HtmlEscape().convert("A törzsszám"); //new HtmlEscape().convert("tÃ¶rzsszÃ¡m");

  @observable String myname = "A törzsszám"; // = new HtmlEscape().convert("A törzsszám"); //new HtmlEscape().convert("tÃ¶rzsszÃ¡m");
  @observable String myname2 = "Günter Zöchbauer - G&uuml;nter Z&ouml;chbauer";

  @override
  void enteredView() {
    super.enteredView();
    //$['hu'].append(new dom.Text("Günter Zöchbauer xx G&uuml;nter Z&ouml;chbauer"));
    //$['hu'].appendHtml("xGünter ZöchbauerxG&uuml;nter Z&ouml;chbauer");
    //files = toObservable(($['uploader'] as dom.InputElement).files);
  }

  filesChanged(old) {
    print('changed: ' + files.toString());
  }

  void uploadFiles(event, details, target) {
    var fileList = ($['uploader'] as dom.InputElement).files;
    files.clear();
    files.addAll(fileList);
  }
}
