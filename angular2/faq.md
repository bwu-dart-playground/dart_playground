- TODO
  - Forms
    - form test not getting valid (Gitter binarious)
    - use custom components as form inputs with `ngModel` (uses ControlValueAccessor)
      - https://github.com/angular/angular/issues/6639#issuecomment-174703547 (with example links)
      - https://github.com/angular/angular/issues/2543
      - http://stackoverflow.com/questions/34995938/ngmodel-custom-valuesaccessor
      - http://stackoverflow.com/questions/34948961/angular-2-custom-form-input
      - http://stackoverflow.com/questions/33981270/bind-angular-2-model-to-polymer-dropdown/33986250
      - http://www.bennadel.com/blog/3007-failure-using-ngmodel-with-a-custom-component-in-angular-2-beta-1.htm
    - getcontrol group values of a component loaded using DCL
      - http://stackoverflow.com/questions/35008412/how-to-get-the-control-group-values-of-a-component-loaded-using-dcl-loadintoloca#35008527
    - dynamic properties http://stackoverflow.com/questions/34632603/dynamic-properties-on-ngformmodel#35227285 mit Plunker from Thierry  

  - Template Variables
    - add using BrowserDomAdapter
      - http://stackoverflow.com/questions/34987560/is-it-possible-to-add-a-local-template-variable-using-browserdomadapter

  - Using Pipes (Read)
    - https://egghead.io/lessons/angular-2-using-pipes-to-filter-data
    - filter pipe http://plnkr.co/edit/ienTN54PdS3bydfDgRGI?p=preview
  
  - async validator 
    - http://plnkr.co/edit/vlzDapiOgVWLNqltEbGb?p=preview
    
    
- Resources
  - escardin/angular2-community-faq https://github.com/escardin/angular2-community-faq#any-good-tutorials-for-the-router
  - angular2 modal source https://github.com/shlomiassaf/angular2-modal/blob/master/src/angular2-modal/providers/Modal.ts#L46
  - public Google Docs https://drive.google.com/drive/folders/0BxgtL8yFJbacQmpCc1NMV3d5dnM

- Change detection
How can we inform angular that there are changes on the component (when using ON_PUSH)?

Can we be running outside angular's zone and still do this?
You can. Call `markForCheck` on a change detector ref, and then call LifeCycle.tick.

  - observables and onPush https://plnkr.co/edit/oUQW5DzrLdUUThIkxLGG?p=preview


- DynamicComponentLoader 
  - with data binding http://plnkr.co/edit/yzKAiXQQQwKi88g6wIdY?p=preview
  - simple loadNextToLocation example https://plnkr.co/edit/LwrrrEcn4rDqWs3bXu3K?p=preview

- custom validators
```
emailValidator(control: Control) {
        let re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
        return (re.test(control.value)) ? null : {message: language.signup.not_email};
}
```
  - https://github.com/angular/angular/blob/master/modules/angular2/src/common/forms/directives/validators.ts#L10
  - https://gist.github.com/qdouble/21cd8448d882c446aca1

- observe inputs 
<input [ngControl]='cont'>
constructor(){
cont=new Control();
cont.subscribe(adjustwidth);

- parsers / formatters ng1 => value-accessors ng2
 https://groups.google.com/forum/#!topic/angular/dKVV_yXQ07s
 https://github.com/angular/angular/issues/6174#issuecomment-169556490

- Plunker example
  - TS template https://plnkr.co/edit/tpl:AvJOMERrnz94ekVua0u5
  - ng-content (extending element) http://plnkr.co/edit/jS8JHmD0xibJ8UGOKlCC?p=preview
  - form validation http://plnkr.co/edit/S8AUiDzuDDdaLpgxhbK6?p=preview 
    http://plnkr.co/edit/riokbSny09yiV17400ip?p=preview
  - @Input() and `@HostBinding()` on the same field https://plnkr.co/edit/JyhQFJfSRLUwNYcENC2M?p=preview

- WebWorkers
  - https://github.com/angular/angular/blob/master/modules/angular2/docs/web_workers/web_workers.md


- Router

  - https://github.com/brandonroberts/angular2-router-example/search?utf8=%E2%9C%93&q=modal
  - https://github.com/brandonroberts/angular2-router-example/blob/81a727d501b4f87e35611c572b864d3ca4a6834c/app/components/app/app.ts
  - route visited 2nd time elementRef different http://plnkr.co/edit/bevGpMAbviaugvNmoFso?p=preview
  - bunch of router examples from brandonroberts
    - https://plnkr.co/edit/Bim8OGO7oddxBaa26WzR?p=preview
  - child routes ttps://plnkr.co/edit/3dnBZEDhpGvVO5aQQswA?p=preview
  - CanActivate and DI https://github.com/angular/angular/issues/4112#issuecomment-153811572
    - http://plnkr.co/edit/Bim8OGO7oddxBaa26WzR?p=preview
    - http://plnkr.co/edit/SF8gsYN1SvmUbkosHjqQ?p=preview (brandonroberts)

  - Router Huge Flaw - Does not allow more than 1 level of nesting 
    - http://plnkr.co/edit/ZM5sltrwn0HdATYjOzlD?p=preview brandonroberts issue #7063
    - http://plnkr.co/edit/yKEyfZz6Xf2l7rRtCXdY?p=preview
    - http://plnkr.co/edit/PzoKVgbZO0Xx6IE3grnG?p=preview
    - https://github.com/angular/angular/issues/6204#issuecomment-173146870
    - http://plnkr.co/edit/Bim8OGO7oddxBaa26WzR?p=preview
  - Async routes cause route data to be lost
    - https://github.com/angular/angular/issues/6272#issuecomment-173176154   
    - https://plnkr.co/edit/N8YwjiBOnAGarRXtRJJO
  - Aux routes
    - http://plnkr.co/edit/5mp8pXsWuLt2yAIQgV3p?p=preview von brandonroberts
    - http://plnkr.co/edit/lquMdagaVfIoAT83w1pl?p=preview
    - https://github.com/angular/angular/issues/4945
    - http://stackoverflow.com/questions/33442363/is-angular-2-auxiliary-router-broken
    ```
    @RouteConfig([
        { path: "/dashboard", component: DashboardComponent, name: "Dashboard", useAsDefault: true },
        { path: "/login", component: LoginComponent, name: "Login” },
        { aux: “/chat", component: ChatComponent, name: “Chat” }
    ])
    ```
    The aux path matches the name of your secondary outlet
    `<router-outlet name=“chat”></router-outlet>`
    https://github.com/angular/angular/issues/4945
        
  - Top navigation example
    - http://plnkr.co/edit/N4OqwUEFFf1f54g3GQPh?p=preview (looks interesting, nice example)
  - Angular — Introduction to ngNewRouter vs ui-router (Read)
    - https://medium.com/angularjs-meetup-south-london/angular-just-another-introduction-to-ngnewrouter-vs-ui-router-72bfcb228017#.akvz1asr4   
  - Wildcard in route: http://plnkr.co/edit/YLtfbHgmufFSqTJp6gju?p=info


- forms
  - different ways of building a form http://stackoverflow.com/questions/35383765/angular2-forms-validations-ngcontrol-ngmodel-etc
  - Model-driven forms using ControlGroup http://plnkr.co/edit/UClEl7ly2LRjYRf7MvY6?p=info
  - forms 
  http://blog.ng-book.com/the-ultimate-guide-to-forms-in-angular-2/
  - valueaccessor http://plnkr.co/edit/slVMz6Kgv6KlnUNMDe3o?p=preview
  - radio buttons http://plnkr.co/edit/B1WPUs36Gkq0ipI8Bvsi?p=preview
                  
  
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
  
- custom injectable annotation
```
- angular2:
    custom_annotations:
      - name: MyInjectable
        import: 'package:mathedit/providers/injectable.dart'
        superClass: Injectable
```
        
- transformers
  - https://github.com/angular/angular/wiki/Angular-2-Dart-Transformer        

- view compiler
  - Angular 2.0: Life of a Template https://docs.google.com/document/d/19_9pshmkAQOA67UWTm41bzWbvikwerVjnCD97D0JS7g/edit

- unittest
  - routing
    - http://stackoverflow.com/questions/34658526/trouble-unit-testing-service-with-the-router-injected-in-the-constructor-in-angu
    - http://stackoverflow.com/questions/35011972/component-undefined-has-no-route-config-aka-how-to-configure-angular-2-router-fo
    - since beta.2
    ```
    // Somewhere in the test setup
    import {setBaseTestProviders} from 'angular2/testing';
    import {
      TEST_BROWSER_PLATFORM_PROVIDERS,
      TEST_BROWSER_APPLICATION_PROVIDERS
    } from 'angular2/platform/testing/browser';
    setBaseTestProviders(TEST_BROWSER_PLATFORM_PROVIDERS,
                         TEST_BROWSER_APPLICATION_PROVIDERS);
    ```
    - test eventemitter http://stackoverflow.com/questions/35319476/any-way-to-test-eventemitter-in-angular2

- Polymer
  - http://plnkr.co/edit/1Gx2G2utKwgnNFvf0I8c?p=preview bind to selected of `<paper-lightbox>`
  - http://stackoverflow.com/questions/35356888/polymer-paper-menu-with-angular2 `<paper-menu>`, `<paper-dropdown-menu>` 

- client-server-communication
  - HTTP interceptors https://github.com/angular/angular/issues/2684
  - https://github.com/angular/http/issues/80

- Animation
  - Using Animation and AnimationBuilder https://plnkr.co/edit/f9X2UfWdExhCh6oAX9hc?p=preview

- FAQ
  - escardin community FAQ 
    - https://github.com/escardin/angular2-community-faq#what-are-observables-and-where-can-i-learn-more-about-them-and-rx
  - unsubscribe stream subscriptions
    - https://github.com/angular/angular/pull/6686/files
  - prevent rendering until async data is available  
    - https://github.com/angular/angular/issues/6674#issuecomment-174699245
  - map(), filter() are missing from Observable
    // maybe update question about `first()` not being available
    - http://stackoverflow.com/questions/34394708/in-angular-2-0-0-beta-0-map-and-filter-are-missing-from-a-form-inputs-obser
    - http://stackoverflow.com/questions/34855992/observable-map-function-not-running-angular2-http
  - communicate between siblings
    - https://github.com/escardin/angular2-community-faq/blob/master/services.md#how-do-i-communicate-between-components-using-a-shared-service
    - http://stackoverflow.com/questions/34700438/global-events-in-angular-2
    - eigner Plunker https://plnkr.co/edit/o88z1FFYcZsNebbcGBsF?p=preview
  - pushstate 404
    - http://stackoverflow.com/questions/31415052/angular-2-0-router-not-working-on-reloading-the-browser (main)
    - http://stackoverflow.com/questions/35077977/angular2-when-refresh-the-page-url-remains-same-but-appropriate-view-doesnt-g  (duplicated)
    - http://stackoverflow.com/questions/34415725/when-i-refresh-my-website-i-get-a-404-this-is-with-angular2-and-firebase/34416946#34416946 (firebase)
    - http://stackoverflow.com/questions/34703343/pathlocationstrategy-vs-hashlocationstrategy-in-web-apps/34703613#34703613 (duplication requested)
    - http://stackoverflow.com/questions/34541532/is-angular-2s-router-broken-when-using-html5-routes/34543822#34543822 (duplicated)
    - http://stackoverflow.com/questions/35052663/routing-aeednd-navigation-in-angular-2/35057576#35057576 (duplication requested)
    That's a browser feature.
    Angular by default uses HTML5 pushstate (PathLocationStrategy in Angular slang). 
    You either need a server that processes all requests like it were requesting `index.html` or you switch to `HashLocationStrategy` (with # in the URL for routes)
    https://angular.io/docs/js/latest/api/router/HashLocationStrategy-class.html
    See also https://ngmilk.rocks/2015/03/09/angularjs-html5-mode-or-pretty-urls-on-apache-using-htaccess/
    - Dart
      - https://github.com/adaojunior/pub_serve_rewrites
    - GitHub issues are for bug reports and feature requests. 
      For support questions please use other channels like [StackOverflow](http://stackoverflow.com/questions/tagged/angular2), [Gitter](https://gitter.im/angular/angular), [Google groups](https://groups.google.com/forum/#!forum/angular), ...
    - DI config setting http://stackoverflow.com/questions/35215112/pass-page-global-variables-into-angular2-app-for-use-with-services/35217704#35217704  
  - ngFor trackBy https://github.com/angular/angular/issues/6907#issuecomment-182359285  
  - ES6 DI Dependency Injection http://stackoverflow.com/questions/33034930/how-to-use-angular2-dynamiccomponentloader-in-es6
