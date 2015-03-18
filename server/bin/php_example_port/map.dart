library map;

void main() {
  var temp = """
  1,201,70
  1,301,71
  3,301,31
  1,401,79
  2,501,2
  1,601,171
  2,801,61
  2,901,100
  5,101,54
  4,203,23
  3,201,112""";
  
  var values = temp.split('\n');
  var floors = new Map<int, Map<int, double>>();
  values.forEach((f) {
    var v = f.trim().split(',');
    var fk = int.parse(v[0]);
    var rk = int.parse(v[1]);
    var rv = double.parse(v[2]);
    if(floors[fk] == null) {
      floors[fk] = new Map<int,double>();
    }
    floors[fk][rk]=rv;
  });
  
  floors.forEach((fk, fv) {
    var tempSum = 0;
    var lowest = null;
    for(var rk in fv.keys) {
      var temp = fv[rk];
      tempSum += temp;
      if(lowest == null || (lowest > temp)) {
        lowest = temp;
      }
    }
    print("Floor #${fk} has ${fv.length} rooms. The average temp is ${tempSum / fv.length}. The lowest temp is ${lowest}.");
  });
}