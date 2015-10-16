import {bootstrap} from 'angular2/bootstrap';
import {bind, Component, View, ViewEncapsulation} from 'angular2/core';
import {MdSwitch} from 'angular2_material/src/components/switcher/switch';
import {UrlResolver} from 'angular2/src/core/services/url_resolver';
import {commonDemoSetup, DemoUrlResolver} from '../demo_common';

@Component({
  selector: 'demo-app',
})
@View({
  templateUrl: './demo_app.html',
  directives: [MdSwitch],
  encapsulation: ViewEncapsulation.None,
})
class DemoApp {
  toggleCount: number;

  constructor() {
    this.toggleCount = 0;
  }

  increment() {
    this.toggleCount++;
  }
}

export function main() {
  commonDemoSetup();
  bootstrap(DemoApp, [bind(UrlResolver).toValue(new DemoUrlResolver())]);
}
