import 'dart:collection';

void main() {

  var values =  {
                 "serviceResponseValue":[
                    {
                       "id":"8a49832747b73fa90147c555292e0050",
                       "oplock":0,
                       "displayName":"name",
                       "description":"description",
                       "urlQueryPath":"",
                       "filterInputParameters":[
                          {
                             "id":"8a49832747b73fa90147c555292e0052",
                             "oplock":0,
                             "datatype":"TIMESTAMP",
                             "name":"beforeTime",
                             "value":"1407765131468"
                          },
                          {
                             "id":"8a49832747b73fa90147c555292e0051",
                             "oplock":0,
                             "datatype":"TIMESTAMP",
                             "name":"afterTime",
                             "value":"1407635531468"
                          }
                       ]
                    },
                    {
                       "id":"8a49832747b73fa90147c55529340053",
                       "oplock":0,
                       "displayName":"name",
                       "description":"description2",
                       "filterInputParameters":[
                          {
                             "id":"8a49832747b73fa90147c55529340054",
                             "oplock":0,
                             "datatype":"TIMESTAMP",
                             "name":"afterTime",
                             "value":"1407592331469"
                          },
                          {
                             "id":"8a49832747b73fa90147c55529340055",
                             "oplock":0,
                             "datatype":"TIMESTAMP",
                             "name":"beforeTime",
                             "value":"1407765131469"
                          }
                       ]
                    },
                    {
                       "id":"8a49832747b73fa90147c555293b0056",
                       "oplock":0,
                       "displayName":"name1",
                       "description":"description3",
                       "filterInputParameters":[
                          {
                             "id":"8a49832747b73fa90147c555293b0057",
                             "oplock":0,
                             "datatype":"INTEGER",
                             "name":"percentageOfMachines",
                             "value":"2"
                          }
                       ]
                    },
                    {
                       "id":"8a49832747b73fa90147c55529410058",
                       "oplock":0,
                       "displayName":"Processes",
                       "description":"description4",
                       "filterInputParameters":[
                          {
                             "id":"8a49832747b73fa90147c55529410059",
                             "oplock":0,
                             "datatype":"INTEGER",
                             "name":"percentageOfMachines",
                             "value":"5"
                          }
                       ]
                    }
                 ],
                 "messages":{
                    "messages":[

                    ]
                 }
              };

  var ddValues = // dropDownList
       // extract the 'displayValue'
       values['serviceResponseValue'].map((e) => e['displayName'])
       // create a set to eliminate duplicates
       .toSet().toList()
       // sort the result
       // sort changes the list it is called - it doesn't return a new list
       // therefore we have to chain it using `..` instead of `.`
       ..sort();

       ddValues.forEach((e) {
         print(e);
        //dropDown.children.add(new OptionElement(data: e, value: e));
       });
//
//  var ddValues = values['serviceResponseValue'].map((e) => e['displayName']).toSet().toList()..sort();
//
//  ddValues.forEach((e) {
//    print(e);
//    //dropDown.children.add(new OptionElement(data: e, value: e));
//  });
}