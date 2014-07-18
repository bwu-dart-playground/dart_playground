import 'dart:html';

void main() {
  var startDate = (querySelector('#start') as DateInputElement);
  var endDate = (querySelector('#end') as DateInputElement);
  var timestamp1 = (querySelector("#timestamp1") as TimeInputElement);
  var timestamp2 = (querySelector("#timestamp2") as TimeInputElement);

   //set to true for when search function is implemented
   //error.hidden = true;


   //button click to handle request
  querySelector('#button').onClick.listen((e) {
    print(startDate.value);
    print(startDate.valueAsDate);
    print(startDate.valueAsNumber);
    print(endDate.value);
    print(endDate.valueAsDate);
    print(endDate.valueAsNumber);
    print(timestamp1.value);
    print(timestamp1.valueAsDate);
    print(timestamp1.valueAsNumber);
    print(timestamp2.value);
    print(timestamp2.valueAsDate);
    print(timestamp2.valueAsNumber);
  });
}