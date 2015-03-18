import 'dart:io' as io;
import 'dart:async' as async;
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;

var images = [
    "https://c4.staticflickr.com/4/3880/15283361621_bc72a1fb29_z.jpg",
    "https://c2.staticflickr.com/4/3923/15101476099_6e1087b76c_h.jpg",
    "https://c2.staticflickr.com/4/3899/15288834802_073d2af478_z.jpg",
    "https://c4.staticflickr.com/4/3880/15283361621_bc72a1fb29_z.jpg",
    "https://c2.staticflickr.com/6/5575/15101869429_fa44a80e87_z.jpg",
    "https://c1.staticflickr.com/3/2941/15100232360_03f3631c44_z.jpg",
    "https://c1.staticflickr.com/3/2941/15269480156_a28e1c0dbb_b.jpg",
    "https://c2.staticflickr.com/4/3907/15103503127_195ffcd5c0_z.jpg",
    "https://c2.staticflickr.com/6/5595/15265903986_a3210505f4_c.jpg",
    "https://c2.staticflickr.com/6/5567/15100857617_9926f2a189_z.jpg",
    "https://c1.staticflickr.com/3/2941/15100542247_6e9c3f13ae_z.jpg",
    "https://c2.staticflickr.com/4/3852/15099895539_cf43a904a5_z.jpg"
];

main() {
  var futures = <async.Future>[];

  images.forEach((url) {
    futures.add(new http.Request('GET', Uri.parse(url))
    .send().then((response) {
      var f = new io.File(path.basename(url));
      var sink = f.openWrite();
      sink.addStream(response.stream)
      .then((_) => sink.close());
    }));
  });
  async.Future.wait(futures)
  .then((_) => print('done'));
}


