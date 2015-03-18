import 'package:google_maps/google_maps.dart';
import 'dart:convert';

class LokSabha {
  LokSabha(this.DPC_ID);
  String get Id => DPC_ID;
  String get Name => DPC_NM;
  String get StateId => DB_STATEID;
  String get StateName => DSTATE_NM;
  String get LSDetailUrl => "http://www.indiavotes.com/pc/detail/$DPC_ID/$DB_STATEID/15";

  List<LatLng> Coordinates;
  List<LSElectionResult> ElectionData;

  var DPC_ID;
  var DPC_NM;
  var DB_STATEID;
  var DSTATE_NM;
  // how to extend following method to serialize complex inner objects too?
  Map toJson() {
     return {"id": DPC_ID, "name": DPC_NM, "stateId": DB_STATEID, "stateName": DSTATE_NM, "ElecData2009": ElectionData};
   }
}
class LSElectionResult {

  String get WinnerName => DWIN_NM;
  String get WinnerParty => DWIN_PRT;

  var RunnerUp;
  var RUParty;
  var WVCount;
  var RUVCount;
  var totalV;
  var VMargin;
  var DPC_ID; // matches with DPC_ID of Loksabha constituency
  var DWIN_NM; //winner name
  var DWIN_PRT; // winner party

  //ADR Data
  var WADRId; // match the myneta info id
  var WEdu;
  var WAssets;
  var WLia;
  var wCrimeCases;

}

void main() {
  var x = new LokSabha('bla');
  x.Coordinates = [new LatLng(10, 20), new LatLng(30,40)];
  x.ElectionData = [new LSElectionResult()..DPC_ID = 'id1', new LSElectionResult()..DPC_ID='id2'];
  print(JSON.encode(x));
}