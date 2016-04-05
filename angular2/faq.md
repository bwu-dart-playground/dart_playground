- TODO
  - debug
    var ngRootEl = window.getAllAngularRootElements()[0];
    var rootNgProbe = window.ng.probe(ngRootEl);
    var appRef = rootNgProbe.inject(window.ng.probe.coreTokens.ApplicationRef);
    appRef.tick();

    var ngZone = rootNgProbe.inject(window.ng.probe.coreTokens.NgZone);
    ngZone.onEventDone.subscribe(function() { console.log('Angular did some work'); });

  - Observables
    - https://angular.io/docs/ts/latest/cookbook/component-communication.html#!#bidirectional-service
    - class that notifies about property changes
       - http://stackoverflow.com/questions/36267119/detect-change-of-nested-property-for-component-input/36267274#36267274
       - https://plnkr.co/edit/wnLWAW?p=preview (own)
    - Observable in service http://stackoverflow.com/questions/34376854/delegation-eventemitter-or-observable-in-angular2/35568924 (Mark)
      - monitor object change http://stackoverflow.com/questions/36267119/detect-change-of-nested-property-for-component-input/36267274#36267274
    - BehaviorSubject http://stackoverflow.com/questions/36372724/how-do-i-ensure-that-a-call-to-subscribe-on-the-observer-initially-receives-the
      - http://stackoverflow.com/questions/36408997/angular2-sending-data-from-a-component-to-a-component-via-service/36409287?noredirect=1#comment60442306_36409287
      - Use Service to communicate between components https://plnkr.co/edit/7sWWpF?p=preview (own)

    obs=new Subject().startWith(4);
    obs.subscribe();
    obs.next(3);
    //prints 4 3

    //not the same as
    obs=new BehaviourSubject(4);
    obs.subscribe(); //prints 4
    obs.next(3); //prints 3
    obs.subscribe(); //prints 3

  - Forms
    - form-level validator http://stackoverflow.com/questions/36399934/angular2-form-validation-on-conditionally-created-input-field
    - form.find() controls https://github.com/angular/angular/issues/5024
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
    - dynamic properties http://stackoverflow.com/questions/34632603/dynamic-properties-on-ngformmodel#35227285 mit Plnkr from Thierry

  - Template Variables
    - add using BrowserDomAdapter
      - http://stackoverflow.com/questions/34987560/is-it-possible-to-add-a-local-template-variable-using-browserdomadapter

  - Using Pipes (Read)
    - https://egghead.io/lessons/angular-2-using-pipes-to-filter-data
    - filter pipe http://plnkr.co/edit/ienTN54PdS3bydfDgRGI?p=preview
    - filter pipe (own example) https://plnkr.co/edit/4Il8QMlh9UYQ4hyrnU3W?p=preview
      http://stackoverflow.com/questions/35571269/angular-2-searchtext
    - orderBy pipe http://embed.plnkr.co/DHLVc0 (see also https://github.com/angular/angular.io/issues/570#issuecomment-191036213)
    - pipe that returns a promise https://plnkr.co/edit/2LupLi?p=preview

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
  - wrapper element for DCL http://stackoverflow.com/questions/36325212/angular-2-dynamic-tabs-with-user-click-chosen-components/36325468#36325468
  - loadAsRoot with data binding http://plnkr.co/edit/yzKAiXQQQwKi88g6wIdY?p=preview
  - eigenes (set id) http://plnkr.co/edit/ihb7dzRlz1DO5piUvoXw?p=preview
  - simple loadNextToLocation example https://plnkr.co/edit/LwrrrEcn4rDqWs3bXu3K?p=preview
  - loadAsRoot workaround
    - https://github.com/angular/angular/issues/6223#issuecomment-195155190
    - https://github.com/angular/angular/issues/6370#issuecomment-193896657 (good example)
    - http://plnkr.co/edit/tcgbI2?p=preview  (https://github.com/angular/angular/issues/7453#issuecomment-193138577)
    - https://github.com/angular/angular/issues/6071#issuecomment-202765309 (register component with change detection)
  - load by name https://plnkr.co/edit/C0U5IIflrMnqxuXVbdw8?p=preview (https://github.com/angular/angular/issues/7652#issuecomment-198365577)

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
  - TS template (public) https://plnkr.co/edit/wnLWAW?p
    (private) https://plnkr.co/edit/uRW34w?p=catalogue
    (old https://plnkr.co/edit/tpl:AvJOMERrnz94ekVua0u5)
  - ng-content (extending element) http://plnkr.co/edit/jS8JHmD0xibJ8UGOKlCC?p=preview
    (ng-content two levels) https://plnkr.co/edit/uRW34w?p=preview
  - form validation http://plnkr.co/edit/S8AUiDzuDDdaLpgxhbK6?p=preview
    http://plnkr.co/edit/riokbSny09yiV17400ip?p=preview
  - @Input() and `@HostBinding()` on the same field https://plnkr.co/edit/JyhQFJfSRLUwNYcENC2M?p=preview
  - Promise, map https://plnkr.co/edit/02OTUm?p=preview

- WebWorkers
  - https://github.com/angular/angular/blob/master/modules/angular2/docs/web_workers/web_workers.md


- Router
  - load routes dynamically
    - http://stackoverflow.com/questions/36350906/dynamic-build-routes-or-dynamic-component-import-angular-2/36351148#36351148
    - http://stackoverflow.com/questions/35887063/dynamic-route-loading-in-angular-2-fails-beta/35889066#35889066

  - routerCanReuse https://github.com/angular/angular/issues/7784#issuecomment-202492405
  - Navigate to parent route (without activating child) http://stackoverflow.com/questions/36274134/angular2-default-route-view/36275487?noredirect=1#comment60179417_36275487 (own Plunker)
  - Get query parameters / redirect after login http://stackoverflow.com/questions/36160118/angular2-redirect-after-login
  - Child routes https://plnkr.co/edit/nt8Zzi?p=preview (zoechi)
  - check if route exists before re-adding it http://plnkr.co/edit/ya8M0spq5ayOvWAeOtYh?p=preview (eigner) http://stackoverflow.com/questions/36114571/configuration-name-conflicts-with-existing-route-name/36114986#36114986
  - navigate to root route http://stackoverflow.com/questions/35896308/angular-2-add-routerlink-in-child-which-points-to-root-router/35896818#35896818
  - regex http://plnkr.co/edit/mk8wPfoqS66Qsuu2yN4F?p=preview brandonroberts
  - https://github.com/brandonroberts/angular2-router-example/search?utf8=%E2%9C%93&q=modal
  - https://github.com/brandonroberts/angular2-router-example/blob/81a727d501b4f87e35611c572b864d3ca4a6834c/app/components/app/app.ts
  - route visited 2nd time elementRef different http://plnkr.co/edit/bevGpMAbviaugvNmoFso?p=preview
  - bunch of router examples from brandonroberts
    - https://plnkr.co/edit/Bim8OGO7oddxBaa26WzR?p=preview
  - child routes https://plnkr.co/edit/3dnBZEDhpGvVO5aQQswA?p=preview
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
  - get all router params also from parent routes https://github.com/angular/angular/issues/5330#issuecomment-188278642
  - get current route
    - https://github.com/angular/angular/issues/7122#issuecomment-185388662
    - https://github.com/angular/angular/issues/5335#issuecomment-170088933
  - Is current route active (Instruction alias) https://github.com/angular/angular/issues/7476 `router.isRouteActive(router.generate(['Parent', 'Child']))`

  - secure router-outlet  CaptainCodeman
```
  import {Directive, Injector, Attribute, ElementRef, DynamicComponentLoader} from 'angular2/core';
  import {Router, RouteData, RouterOutlet, RouteParams, Instruction, ComponentInstruction} from 'angular2/router';

  /*
    Example implementation

    Given a route:
    @RouteConfig([
    { path: '/thing/:id', component: ThingComponent, name: 'Thing', data: { public: false, roles:['thinger'] } }
    ])

    authorize(instruction: ComponentInstruction):boolean {
      // simplest case - route is public
      if (<boolean>instruction.routeData.data['public']) {
        return true;
      }

      // if not public then we at least need an authenticated user
      if (this.isAuthenticated()) {
        var routeRoles = <any[]>instruction.routeData.data['roles'];
        var userRoles = <string[]>this.roles();

        // no roles required for route = user just needs to be authenticated
        var authorized = routeRoles.length === 0 || routeRoles.some(routeRole => userRoles.indexOf(routeRole) >= 0);

        return authorized;
      }

      return false;
    }
  */
  export abstract class IAuthService {
    abstract isAuthenticated():boolean;
    authorize(instruction: ComponentInstruction, params:any):boolean {
      // authorized if route allows public access or user is authenticated
      return this.isAuthenticated() || <boolean>instruction.routeData.data['public']
    }
  }

  @Directive({selector: 'secure-outlet'})
  export class SecureRouterOutlet extends RouterOutlet {
    signin:string;
    unauthorized:string;
    injector:Injector;

    private parentRouter: Router;
    private authService: IAuthService;

    constructor(_elementRef: ElementRef, _loader: DynamicComponentLoader,
                _parentRouter: Router, @Attribute('name') nameAttr: string,
                authService:IAuthService,
                injector:Injector,
                @Attribute('signin') signinAttr: string,
                @Attribute('unauthorized') unauthorizedAttr: string) {
      super(_elementRef, _loader, _parentRouter, nameAttr);
      this.parentRouter = _parentRouter;
      this.authService = authService;
      this.injector = injector;
      this.signin = signinAttr;
      this.unauthorized = unauthorizedAttr;
    }

    activate(nextInstruction: ComponentInstruction): Promise<any> {
      var params = this.getAllRouteParams(this.injector);
      var isAuthorized = this.authService.authorize(nextInstruction, params);

      if (isAuthorized) {
        return super.activate(nextInstruction);
      }

      if (this.authService.isAuthenticated()) {
        var ins = this.parentRouter.generate([this.unauthorized]);
        return super.activate(ins.component);
      } else {
        var ins = this.parentRouter.generate([this.signin,{url:location.pathname}]);
        return super.activate(ins.component);
      }
    }

    reuse(nextInstruction: ComponentInstruction): Promise<any> {
      return super.reuse(nextInstruction);
    }

    getAllRouteParams(injector) {
      let params = null;
      while(injector) {
        const routeParams = injector.getOptional(RouteParams);
        if (routeParams) {
          if (params === null) {
            params = {};
          } else {
            params = Object.create(params);
          }

          Object.assign(params, routeParams.params);
        }
        injector = injector.parent;
      }
      return params;
    }
  }
  ```


- forms
  - uppercase directive https://plnkr.co/edit/MzVOCK?p=preview (eigener)
  - different ways of building a form http://stackoverflow.com/questions/35383765/angular2-forms-validations-ngcontrol-ngmodel-etc
  - Model-driven forms using ControlGroup http://plnkr.co/edit/UClEl7ly2LRjYRf7MvY6?p=info
    http://blog.ng-book.com/the-ultimate-guide-to-forms-in-angular-2/
  - valueaccessor
    - https://github.com/angular/angular/issues/2543 (eigenes funktionierendes Beispiel)
    - http://plnkr.co/edit/slVMz6Kgv6KlnUNMDe3o?p=preview
    - see also https://github.com/angular/angular/issues/2543  (https://plnkr.co/edit/Bz7wLC5qq7s6Fph1UwpC?p=preview)

  - radio buttons http://plnkr.co/edit/B1WPUs36Gkq0ipI8Bvsi?p=preview (custom value accessor for radio)
  - https://plnkr.co/edit/988PSJKXCfrUXfLOGgyg?p=preview (http://stackoverflow.com/questions/35653175/how-to-bind-to-radio-buttons-in-angular2-beta-6)
  - validator for depending fields (password repeat) http://plnkr.co/edit/NqQhBPJJo1PzHfisvh9J?p=preview  (@escardin)

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

  - number validator example with different ways to access to valid state https://plnkr.co/edit/As15rN9GfgkoprVQ1rOq?p=preview
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
  - viewContainer createEmbeddedView (https://github.com/angular/angular/issues/7443)
    - http://plnkr.co/edit/LK1Aa3vhawd2sMl0Wj6F
    - http://plnkr.co/edit/GNYqQROgM7DQ4ly9G8Xz?p=preview (tabs from https://github.com/angular/angular/issues/6310)
  - http://plnkr.co/edit/fwd1kh9TXfemagpuDnLZ?p=preview (TemplateRef, ViewContainerRef)

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
    - test http https://github.com/angular/http/issues/58
       https://github.com/angular/angular/issues/5570#issuecomment-189852510
    - TestComponentBuilder get reference to the element (2 ways same effect)
      ```
      fixture.detectChanges();
      // get a copy of our miniDOM
      let compiled = fixture.elementRef.nativeElement;
      // get a reference tot he component(controller)
      let component = fixture.debugElement.componentInstance;
      ```

- Polymer
  - http://plnkr.co/edit/1Gx2G2utKwgnNFvf0I8c?p=preview bind to selected of `<paper-lightbox>`
  - http://stackoverflow.com/questions/35356888/polymer-paper-menu-with-angular2 `<paper-menu>`, `<paper-dropdown-menu>`
  - http://plnkr.co/edit/kMuyWiNfDwrLSSc3JGDx?p=preview (selbst zusammengebastelt)
  - paper-input https://github.com/angular/angular/issues/5360, http://stackoverflow.com/questions/35867952/how-to-use-angular2-ngmodel-for-polymer-paper-input-error-no-value-accessor-fo

- client-server-communication
  - HTTP interceptors https://github.com/angular/angular/issues/2684
  - https://github.com/angular/http/issues/80

- Animation
  - Using Animation and AnimationBuilder https://plnkr.co/edit/f9X2UfWdExhCh6oAX9hc?p=preview
  - Simple keyframes, ngFor http://plnkr.co/edit/SXzyyN?p=preview
  - page transition animation http://plnkr.co/edit/FikHIEPONMYhr6COD9Ou?p=info
    http://stackoverflow.com/questions/33553828/page-transition-animations-with-angular-2-0-router-and-component-interface-promi
  - hide spinner on load http://stackoverflow.com/questions/36234211/how-to-set-animation-on-first-element-on-loading

- Project setup
  - cannot find Promise
  - Internet Explorer
    - https://github.com/angular/angular/issues/6391, https://github.com/angular/angular/issues/7144#issuecomment-190012839

- Aria roles https://github.com/angular/angular/issues/754

- Dart Transformers
  - https://github.com/angular/angular/wiki/Advanced-Transformer-Configuration
  - https://github.com/angular/angular/pull/7464/files
```
  # from https://github.com/kegluneq/angular/blob/use_split_transformers/modules/playground/pubspec.yaml
  transformers:
  - angular2/transform/codegen:
      platform_directives: 'package:angular2/src/common/directives.dart#CORE_DIRECTIVES'
  - angular2/transform/reflection_remover:
      $include:
          - web/src/animate/index.dart
          - web/src/async/index.dart

  - angular2/transform/deferred_rewriter:
      # No playground apps use deferred imports, but in general
      # all libraries with deferred imports should be included.
      $include: []

  - $dart2js:
      $include:
          - web/src/**
      $exclude:
          # web worker code compiled separately; see below
          - web/src/web_workers/**
      minify: false
      commandLineOptions:
          - --show-package-warnings
          - --trust-type-annotations
          - --trust-primitives
          - --enable-experimental-mirrors
```

  - Service
    - Http
      - ensure only one request http://stackoverflow.com/questions/36271899/what-is-the-correct-way-to-share-the-result-of-an-angular-2-http-network-call-in
      - HTTP Request
        - Get the current base URL http://stackoverflow.com/questions/36222845/how-to-get-domain-name-for-service-in-angular2
        - get cached data http://stackoverflow.com/questions/36271899/what-is-the-correct-way-to-share-the-result-of-an-angular-2-http-network-call-in

  - Authentication
    - http://stackoverflow.com/questions/34331478/angular2-redirect-to-login-page


- FAQ
  - ngClass http://stackoverflow.com/a/33713824/217408
  - add ROUTER_DIRECTIVES to PLATFORM_DIRECTIVES
    `provide(PLATFORM_DIRECTIVES, {useValue: [ROUTER_DIRECTIVES], multi: true})`
  - add pipes to PLATFORM_PIPES
    `bootstrap(App, [provide(PLATFORM_PIPES, {useValue: RainbowizePipe, multi:true})]);`
  - GitHub issues are for bug reports and feature requests.
    For support questions please use other channels like the ones listed in [CONTRIBUTING - Got a Question or Problem?](https://github.com/angular/angular/blob/master/CONTRIBUTING.md#question)

    There is a nice new GitHub feature to "add reaction"s instead of `+1` posts. Please use this instead :+1:

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
    - eigner Plnkr https://plnkr.co/edit/o88z1FFYcZsNebbcGBsF?p=preview
  - pushstate 404
    - http://stackoverflow.com/questions/35137573/angular-2-router-es5-doesnt-work-on-page-reload/35137712#35137712 (own)
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
    - DI config setting http://stackoverflow.com/questions/35215112/pass-page-global-variables-into-angular2-app-for-use-with-services/35217704#35217704
  - ngFor trackBy
    - https://github.com/angular/angular/issues/6907#issuecomment-182359285
    - http://www.bennadel.com/blog/3020-understanding-object-identity-with-ngfor-loops-in-angular-2-beta-3.htm
  - ES6 DI Dependency Injection http://stackoverflow.com/questions/33034930/how-to-use-angular2-dynamiccomponentloader-in-es6
  - status of multiple checkboxes http://plnkr.co/edit/N9NXBYcwhon6ITr8RP5y?p=preview
    http://stackoverflow.com/questions/35592529/why-did-deleting-my-web-assets-folder-also-delete-all-source-in-lib/35598277?noredirect=1#comment58922781_35598277
    similar with buttons http://plnkr.co/edit/bhHbSd5ReCxtxRNI9ogx?p=preview
  - dynamic templates https://github.com/angular/angular/issues/7596#issuecomment-196881527
   - http://stackoverflow.com/questions/36008476/how-to-realize-website-with-hundreds-of-pages-in-angular2
  - Google doesn't provide timelines. As you know it's hard to make estimates for software project.
     You can follow https://docs.google.com/document/d/150lerb1LmNLuau_a_EznPV1I1UHMTbEl61t4hZ7ZpS0/edit to see what next steps are planned.
     See also https://github.com/escardin/angular2-community-faq
  - ngFor with JSON
  - @ViewChildren, @ContentChildren
    - http://plnkr.co/edit/5kJfvIjnC1ROKuXPKNKX?p=preview (own) simple
    - http://plnkr.co/edit/h8aT7cPuW2PCWBqUzlth?p=preview (own) more variations
    - http://stackoverflow.com/questions/36329658/angular-2-select-object-from-the-dom-and-set-the-focus/36329983#36329990 (own Plunker) find by element attribute

  - Http Interceptors http://stackoverflow.com/questions/36261100/what-is-angular-2-analogue-solution-for-angular-1-interceptors


