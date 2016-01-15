- change detection
How can we inform angular that there are changes on the component (when using ON_PUSH)?

Can we be running outside angular's zone and still do this?
You can. Call `markForCheck` on a change detector ref, and then call LifeCycle.tick.


- DynamicComponentLoader with data binding
http://plnkr.co/edit/yzKAiXQQQwKi88g6wIdY?p=preview

- forms 
http://blog.ng-book.com/the-ultimate-guide-to-forms-in-angular-2/

- multiple validators
@weizlini email: ["", Validators.compose([ Validators.required, Validators.minLength(2), Validators.maxLength(40), Utilities.emailValidator ])],
/////
this.form = fb.group({
            email: ["", Validators.compose([
                Validators.required,
                Validators.minLength(2),
                Validators.maxLength(40),
                Utilities.emailValidator
            ])],
            password: ["", Validators.compose([
                Validators.required,
                Validators.minLength(2),
                Validators.maxLength(20)
            ])]
        });
//////
you can also implement the Validator interface from angular2/core (and decorate it with @Directive) and use it directly on the template
/// https://plnkr.co/edit/5yO4HviXD7xIgMQQ8WKs?p=preview

- custom validators
emailValidator(control: Control) {
        let re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
        return (re.test(control.value)) ? null : {message: language.signup.not_email};
}

- observe inputs 
<input [ngControl]='cont'>
constructor(){
cont=new Control();
cont.subscribe(adjustwidth);

- parsers / formatters ng1 => value-accessors ng2
 https://groups.google.com/forum/#!topic/angular/dKVV_yXQ07s
 https://github.com/angular/angular/issues/6174#issuecomment-169556490

- Plunker example
TS template https://plnkr.co/edit/tpl:AvJOMERrnz94ekVua0u5
ng-content (extending element) http://plnkr.co/edit/jS8JHmD0xibJ8UGOKlCC?p=preview
route visited 2nd time elementRef different http://plnkr.co/edit/bevGpMAbviaugvNmoFso?p=preview
bunch of router examples http://plnkr.co/edit/Bim8OGO7oddxBaa26WzR?p=preview
form validation http://plnkr.co/edit/S8AUiDzuDDdaLpgxhbK6?p=preview 
    http://plnkr.co/edit/riokbSny09yiV17400ip?p=preview
wildcard in route: http://plnkr.co/edit/YLtfbHgmufFSqTJp6gju?p=info

- WebWorkers
https://github.com/angular/angular/blob/master/modules/angular2/docs/web_workers/web_workers.md
