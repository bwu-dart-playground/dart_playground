import 'dart:convert'; //used to convert json
import 'package:http/http.dart' as http; //for the http requests

//config
final fbBaseUri = "https://graph.facebook.com/v2.1";
final fbAppID = "XXX";
final fbAppSecret = "XXY";

class fbuser {
  int fbid;
  String accessToken;

  fbuser(this.fbid, this.accessToken); //constructor for the object

  groupIds(){ //method to get a list of group IDs
    var url = "$fbBaseUri/me/groups?access_token=$accessToken"; //URL for the API request
    http.get(url)
    .then((response) { //once the response is here either process it or return an error
      print ('response received');
      if (response.statusCode == 200) {
        var json = JSON.decode(response.body);
        List groups=[];
        for (int i = 0; i<json['data'].length; i++) {
          groups.add(json['data'][i]['id']);
        }
        print(groups.length.toString()+ " Gruppen gefunden");
        return groups; //return the list of IDs
      }
      else { print("Response status: ${response.statusCode}");
      return (['error']); //return a list with an error element
      }
    });
  }
}

void main() {
  var usr = new fbuser(123, 'XYY'); //construct user
  print(usr.groupIds()); //call method to get the IDs
}
