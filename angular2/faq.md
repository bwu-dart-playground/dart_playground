- TODO
  - form test not getting valid (Gitter binarious)

- resources
  - escardin/angular2-community-faq https://github.com/escardin/angular2-community-faq#any-good-tutorials-for-the-router
  - angular2 modal source https://github.com/shlomiassaf/angular2-modal/blob/master/src/angular2-modal/providers/Modal.ts#L46

- change detection
How can we inform angular that there are changes on the component (when using ON_PUSH)?

Can we be running outside angular's zone and still do this?
You can. Call `markForCheck` on a change detector ref, and then call LifeCycle.tick.


- DynamicComponentLoader with data binding
http://plnkr.co/edit/yzKAiXQQQwKi88g6wIdY?p=preview

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

- pushstate 404
That's a browser feature.
Angular by default uses HTML5 pushstate (PathLocationStrategy in Angular slang). 
You either need a server that processes all requests like it were requesting `index.html` or you switch to `HashLocationStrategy` (with # in the URL for routes)
https://angular.io/docs/js/latest/api/router/HashLocationStrategy-class.html
See also https://ngmilk.rocks/2015/03/09/angularjs-html5-mode-or-pretty-urls-on-apache-using-htaccess/

- Plunker example
  - TS template https://plnkr.co/edit/tpl:AvJOMERrnz94ekVua0u5
  - ng-content (extending element) http://plnkr.co/edit/jS8JHmD0xibJ8UGOKlCC?p=preview
  - form validation http://plnkr.co/edit/S8AUiDzuDDdaLpgxhbK6?p=preview 
    http://plnkr.co/edit/riokbSny09yiV17400ip?p=preview
  - wildcard in route: http://plnkr.co/edit/YLtfbHgmufFSqTJp6gju?p=info

- WebWorkers
  - https://github.com/angular/angular/blob/master/modules/angular2/docs/web_workers/web_workers.md


- router
  - route visited 2nd time elementRef different http://plnkr.co/edit/bevGpMAbviaugvNmoFso?p=preview
  - bunch of router examples http://plnkr.co/edit/Bim8OGO7oddxBaa26WzR?p=preview
  - CanActivate and DI https://github.com/angular/angular/issues/4112#issuecomment-153811572
     http://plnkr.co/edit/Bim8OGO7oddxBaa26WzR?p=preview
  - Router Huge Flaw - Does not allow more than 1 level of nesting 
     http://plnkr.co/edit/yKEyfZz6Xf2l7rRtCXdY?p=preview
     http://plnkr.co/edit/PzoKVgbZO0Xx6IE3grnG?p=preview
     https://github.com/angular/angular/issues/6204#issuecomment-173146870
  - Async routes cause route data to be lost
     https://github.com/angular/angular/issues/6272#issuecomment-173176154   
     https://plnkr.co/edit/N8YwjiBOnAGarRXtRJJO
  - Aux routes
     http://plnkr.co/edit/lquMdagaVfIoAT83w1pl?p=preview
     https://github.com/angular/angular/issues/4945
     http://stackoverflow.com/questions/33442363/is-angular-2-auxiliary-router-broken

- forms
  - Model-driven forms using ControlGroup http://plnkr.co/edit/UClEl7ly2LRjYRf7MvY6?p=info
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
  
