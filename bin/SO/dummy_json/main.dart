import 'dart:convert' show JSON;

void main() {

  // literal syntax to create maps and lists (nested)
  var json1 =
    {
      "title": "QUESTIONNAIRE TITLE",
      "introduction": "Introduction to the questionnaire.",
      "questions": [{
            "id": "1",
            "text": "Where do you live?",
            "possibleAnswers": [{
                  "id": "A",
                  "text": "Brasil"
                }, {
                  "id": "B",
                  "text": "Outside Brasil"
                }]},{
            "id": "2",
            "text": "Select your favorite color",
            "possibleAnswers": [{
                  "id": "A",
                  "text": "Red"},{
                  "id": "B",
                  "text": "Green"},{
                  "id": "C",
                  "text": "Blue"}]}]};
  print(json1); // not JSON, just Map.toString() but looks almost like JSON

  print("=====================================");


  var json2 = {};
  // json2 = new Map(); // would do exactly the same as the line above
  json2["title"] = "QUESTIONNAIRE TITLE";
  json2["introduction"] = "Introduction to the questionnaire.";
  json2["questions"] = [];

  var q = {};
  json2["questions"].add(q);
  q["id"] = "1";
  q["text"] = "Where do you live?";
  q["possibleAnswers"] = [];
  // q["possibleAnswers"] = new List(); // would do exactly the same as the line above
  q["possibleAnswers"].add({});
  // q["possibleAnswers"].add(new Map()); // would do exactly the same as the line above
  q["possibleAnswers"][0]["id"] = "A";
  q["possibleAnswers"][0]["text"] = "Brasil";

  q["possibleAnswers"].add({"id": "B","text": "Outside Brasil"}); // you can mix collection access and literal syntax

  q = {};
  json2["questions"].add(q);
  q["id"] = "2";
  q["text"] = "Select your favorite color";
  q["possibleAnswers"] = [];
  q["possibleAnswers"].add({});
  q["possibleAnswers"][0]["id"] = "A";
  q["possibleAnswers"][0]["text"] = "Red";
  q["possibleAnswers"].add({"id": "B","text": "Green"});
  q["possibleAnswers"].add({"id": "C","text": "Blue"});

  print(json2); // not JSON, just Map.toString() but looks almost like JSON

  print("=====================================");

  print("title: ${json2["title"]}");
  print("introduction: ${json2["introduction"]}");
  print("questions:");
  json2["questions"].forEach((e) => print(e));
  json2["questions"].forEach((e) {
    print("QUESTION:");
    print("id: ${e["id"]}");
    print("text: ${e["text"]}");
    print("  Possible Answers:");
    e["possibleAnswers"].forEach((a) {
      print("    id: ${a["id"]}");
      print("    text: ${a["text"]}");
    });
  });

  print("=====================================");

  json2["questions"][0]["possibleAnswers"].forEach((e) {
    print(e["text"]);
  });

  print("=====================================");

  print((json2["questions"][1]["possibleAnswers"] as List).firstWhere((e) => e["id"] == "B")["text"]);

  print("=====================================");

  var jsonString = JSON.encode(json2);
  print(jsonString);
  // This is different !! Here you have real JSON.
  // In the above examples just the toString() method of the Map object was calls.
  // This looks like json but is not JSON (misses a lot of ")


  print("=====================================");

  // convert the real JSON back to nested Maps and Lists
  var json3 = JSON.decode(jsonString);
  print(json3);


}