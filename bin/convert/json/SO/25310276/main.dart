import 'dart:convert' show JSON;

void main() {
var jsonString = r'''{
  "serviceResponseValue": [
    {
      "id": "8a4984e047d0e40d0147d0e40ff80000",
      "oplock": 0,
      "displayName": "Domains registered",
      "description": "descript",
      "urlQueryPath": "url",
      "filterOutputParameters": [
        {
          "id": "8a4984e047d0e40d0147d0e410010001",
          "oplock": 0,
          "datatype": "STRING",
          "name": "Asset Domain Name",
          "value": "$.sourceAsset.domainName",
          "order": 3
        },
        {
          "id": "8a4984e047d0e40d0147d0e410010003",
          "oplock": 0,
          "datatype": "TIMESTAMP",
          "name": "Time of Registration",
          "value": "$.targetAsset.registrationTime",
          "order": 2
        },
        {
          "id": "8a4984e047d0e40d0147d0e410020004",
          "oplock": 0,
          "datatype": "STRING",
          "name": "Asset IP",
          "value": "$.sourceAsset.ipAddress",
          "order": 4
        },
        {
          "id": "8a4984e047d0e40d0147d0e410010002",
          "oplock": 0,
          "datatype": "STRING",
          "name": "Recently Registered IP",
          "value": "$.targetAsset.ipAddress",
          "order": 1
        },
        {
          "id": "8a4984e047d0e40d0147d0e410020006",
          "oplock": 0,
          "datatype": "TIMESTAMP",
          "name": "Access Time",
          "value": "$.queryTime",
          "order": 5
        },
        {
          "id": "8a4984e047d0e40d0147d0e410020005",
          "oplock": 0,
          "datatype": "STRING",
          "name": "Recently Registered Domain Name",
          "value": "$.targetAsset.domainName",
          "order": 0
        }
      ],
      "filterInputParameters": [
        {
          "id": "8a4984e047d0e40d0147d0e410020008",
          "oplock": 0,
          "datatype": "TIMESTAMP",
          "name": "afterTime",
          "value": "1407829331943"
        },
        {
          "id": "8a4984e047d0e40d0147d0e410020007",
          "oplock": 0,
          "datatype": "TIMESTAMP",
          "name": "beforeTime",
          "value": "1407958931943"
        }
      ]
    },
    {
      "id": "8a49837547d9bcad0147d9bcb2970009",
      "oplock": 0,
      "displayName": "48 hours",
      "description": "48 hours description",
      "urlQueryPath": "url",
      "filterOutputParameters": [
        {
          "id": "8a49837547d9bcad0147d9bcb297000c",
          "oplock": 0,
          "datatype": "STRING",
          "name": "Asset Domain Name",
          "value": "$.sourceAsset.domainName",
          "order": 3
        },
        {
          "id": "8a49837547d9bcad0147d9bcb297000d",
          "oplock": 0,
          "datatype": "TIMESTAMP",
          "name": "Time of Registration",
          "value": "$.targetAsset.registrationTime",
          "order": 2
        },
        {
          "id": "8a49837547d9bcad0147d9bcb297000a",
          "oplock": 0,
          "datatype": "STRING",
          "name": "Asset IP",
          "value": "$.sourceAsset.ipAddress",
          "order": 4
        },
        {
          "id": "8a49837547d9bcad0147d9bcb297000b",
          "oplock": 0,
          "datatype": "STRING",
          "name": "Recently Registered IP",
          "value": "$.targetAsset.ipAddress",
          "order": 1
        },
        {
          "id": "8a49837547d9bcad0147d9bcb298000e",
          "oplock": 0,
          "datatype": "STRING",
          "name": "Recently Registered Domain Name",
          "value": "$.targetAsset.domainName",
          "order": 0
        },
        {
          "id": "8a49837547d9bcad0147d9bcb298000f",
          "oplock": 0,
          "datatype": "TIMESTAMP",
          "name": "Access Time",
          "value": "$.queryTime",
          "order": 5
        }
      ],
      "filterInputParameters": [
        {
          "id": "8a49837547d9bcad0147d9bcb2980010",
          "oplock": 0,
          "datatype": "TIMESTAMP",
          "name": "afterTime",
          "value": "1407935935019"
        },
        {
          "id": "8a49837547d9bcad0147d9bcb2980011",
          "oplock": 0,
          "datatype": "TIMESTAMP",
          "name": "beforeTime",
          "value": "1408108735019"
        }
      ]
    }
  ]
}
''';

   //var dropDown = querySelector("#asset");

   Map jsonObject = JSON.decode(jsonString) as Map;

   print(jsonObject["serviceResponseValue"][1]);
//   //var dropDownList = jsonObject["serviceResponseValue"] as List<Map>;
//
//   //LinkedHashMap<String, Map> dataMap = new LinkedHashMap<String, Map>();
//
////the one causing issues and returning null
//     //var ddValues2 = dropDownList
//       //extract the 'displayValue'
//       .map((e2) => e2['filterInputParameters']['value']);
//       //create a set to eliminate duplicates
//       //.toSet().toList()
//       //sort the result
//       //..sort();
//
//       ddValues2.forEach((e2) {
//         print(e2);
//
//       });

}