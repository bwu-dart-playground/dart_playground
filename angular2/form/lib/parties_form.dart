library form.parties_form;

import 'package:angular2/angular2.dart';

/// <reference path="../../typings/angular2-meteor.d.ts" />


//import {FORM_DIRECTIVES, FormBuilder, Control, ControlGroup, Validators} from 'angular2/angular2';

//import {Parties} from 'collections/parties';

@Component(
    selector: 'parties-form'
,
    templateUrl: 'parties_form.html',
    directives: const [FORM_DIRECTIVES]
)
class PartiesForm {
  ControlGroup partiesForm;

  PartiesForm() {
        FormBuilder fb = new FormBuilder();
        this.partiesForm = fb.group({
            'name': ['', Validators.required],
            'description': [''],
            'location': ['', Validators.required]
        });
        // Test
        print(partiesForm.value);
    }

    void addParty(Map party) {
        print('assParty ${party}');
        return;
//        if (this.partiesForm.valid) {
//            Parties.insert({
//                name: party.name,
//                description: party.description,
//                location: party.location
//            });
//
//            (<Control>this.partiesForm.controls['name']).updateValue('');
//            (<Control>this.partiesForm.controls['description']).updateValue('');
//            (<Control>this.partiesForm.controls['location']).updateValue('');
//        }
    }

}
