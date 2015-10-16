import {bootstrap} from 'angular2/bootstrap';
import {bind, Component, UrlResolver, View, ViewEncapsulation} from 'angular2/core';
import {MdRadioButton, MdRadioGroup} from 'angular2_material/src/components/radio/radio_button';
import {MdRadioDispatcher} from 'angular2_material/src/components/radio/radio_dispatcher';
import {commonDemoSetup, DemoUrlResolver} from '../demo_common';

@Component({
  selector: 'demo-app',
  viewBindings: [MdRadioDispatcher],
})
@View({
  templateUrl: './demo_app.html',
  directives: [MdRadioGroup, MdRadioButton],
  encapsulation: ViewEncapsulation.None,
})
class DemoApp {
  thirdValue;
  groupValueChangeCount;
  individualValueChanges;
  pokemon;
  someTabindex;

  constructor() {
    this.thirdValue = 'dr-who';
    this.groupValueChangeCount = 0;
    this.individualValueChanges = 0;
    this.pokemon = '';
    this.someTabindex = 888;
  }

  chooseCharmander() {
    this.pokemon = 'fire';
  }

  onGroupChange() {
    this.groupValueChangeCount++;
  }

  onIndividualClick() {
    this.individualValueChanges++;
  }
}

export function main() {
  commonDemoSetup();
  bootstrap(DemoApp, [bind(UrlResolver).toValue(new DemoUrlResolver())]);
}
