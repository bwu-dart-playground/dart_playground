import "dart:isolate";

void main() {
  print("Starting");
  var sPort = new ReceivePort();
  SendPort rPort;
  sPort.listen((msg) {
    if (msg is SendPort) {
      print("Host got port. sending back");
      rPort = msg;
      rPort.send("Hello!");
    }
    else print("Host got $msg");
    rPort.send(null);
    sPort.close();
  });
  Isolate.spawn(test,sPort.sendPort);
}
void test(sender) {
  var rPort = new ReceivePort();
  sender.send(rPort.sendPort);
  rPort.listen((msg){
    print("Worker got $msg");
    if (msg!=null)
      sender.send("I am worker");
    else rPort.close();
  });
}