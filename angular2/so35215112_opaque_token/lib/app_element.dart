library so35215112_opaque_token.app_element;

import 'package:angular2/core.dart' show Component, View, Input, Output, Inject, OpaqueToken;


const OpaqueToken globalConfigValue = const OpaqueToken('GlobalConfigValue');

@Component(
    selector: 'app-element'
,
    template: '''
<h1>app-element</h1>
<div>config: {{globalConfigValue}}</div>
''' //,
//    directives: const [FORM_DIRECTIVES]
)
class AppElement {
  String globalConfigValue;
  AppElement(@Inject(globalConfigValue) this.globalConfigValue);
}
