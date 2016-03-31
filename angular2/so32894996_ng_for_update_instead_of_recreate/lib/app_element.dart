library so32894996_ng_for_update_instead_of_recreate.app_element;

import 'dart:math' show Random;
import 'package:angular2/angular2.dart';

@Component(selector: 'app-element',
    template: '''<h3>app-element</h3>
    <map></map>''',
    directives: const [MapComponent])
class AppElement {}

@Component(selector: 'map',
    template: '''
<button (click)="changeValue()">Change value</button>
<marker *ngFor="#m of markersIndexes" [model]="markers[m]"></marker>
''',
    directives: const [MarkerComponent, NgFor])
class MapComponent {
  MapComponent() {
    markers = <Marker>[
      new Marker('m0', 0),
      new Marker('m1', 1),
      new Marker('m2', 2),
      new Marker('m3', 3)
    ];
    markersIndexes = new List<int>.generate(markers.length, (int index) => index);
  }
  List<Marker> markers;
  List<int> markersIndexes;

  Random _rnd = new Random();
  void changeValue() {
    int idx = _rnd.nextInt(3);
    markers[idx].position = _rnd.nextInt(100);
  }
}

@Component(selector: 'marker',
    template: '''
<h3>marker</h3>
<div>name: {{model.name}} pos: {{model.position}} created: {{createdAt}}</div>
''',
    styles: const [
      '''
:host {
  display: block;
  border: 1px solid green;
}
'''
    ])
class MarkerComponent implements OnInit {
  @Input() Marker model;
  String createdAt;

  MarkerComponent() {
    createdAt = new DateTime.now().toString();
  }
  void ngOnInit() {
    print(model);
  }
}

class Marker {
  String name;
  int position;

  Marker(this.name, this.position);

  @override
  String toString() => 'Marker: $name - $position';
}
