import 'dart:html';

main () {
  TextInputElement zoomPresets = new TextInputElement();

  DataListElement presetDataList = new DataListElement()..id="presetDataList";
     OptionElement option1 = new OptionElement();
     option1.value="25%";
     presetDataList.children.add(option1);

     zoomPresets.attributes['list'] = presetDataList.id;

     document.body.append(zoomPresets);
     document.body.append(presetDataList);
}

