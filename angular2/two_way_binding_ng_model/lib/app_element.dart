library two_way_binding_ng_model.app_element;

import 'package:angular2/angular2.dart';
import 'dart:html' show Event, VideoElement;

@Component(
    selector: 'app-element',
    viewProviders: const [VideoModel], directives: const [VideoModel],
    templateUrl: 'app_element.html') //,
//    host: const {'duration-changed': r'durationChanged($event)'})
//@View(templateUrl: 'app_element.html', directives: const [VideoModel])
class AppElement {
  @ViewChild(VideoModel)
  VideoModel video;
  AppElement() {
    print('AppElement');
  }
  String source =
      'http://commondatastorage.googleapis.com/gtv-videos-bucket/big_buck_bunny_1080p.mp4';
  //'https://www.youtube.com/watch?v=R7GLYhJ51uo';

  num duration;

  void durationChanged(num event) {
    print('${event.runtimeType} $event');
    duration = event;
  }
}

@Directive(selector: 'video')
class VideoModel {
  ElementRef _element;
  VideoModel(this._element) {
    VideoElement video = _element.nativeElement as VideoElement;
    video.onDurationChange.listen((_) => duration = video.duration);
  }

  num duration;

//  @Output('durationChanged')
//  final EventEmitter durationChangedEvent = new EventEmitter();

//  void _durationChanged(Event event) {
//    duration = (event.target as VideoElement).duration;
//    durationChangedEvent.emit(duration);
//  }
}
