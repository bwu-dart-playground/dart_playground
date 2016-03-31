import 'package:angular2/core.dart'
    show Renderer, ElementRef, Component, Directive, Injectable;
import 'package:angular2/src/facade/lang.dart' show StringWrapper;
import 'dart:html' show KeyboardEvent;

// A service available to the Injector, used by the HelloCmp component.
@Injectable()
class GreetingService {
  String greeting = 'hello';
}

// Directives are light-weight. They don't allow new
// expression contexts (use @Component for those needs).
@Directive(selector: '[red]')
class RedDec {
  // ElementRef is always injectable and it wraps the element on which the
  // directive was found by the compiler.
  constructor(ElementRef el, Renderer renderer) {
    renderer.setElementStyle(el.nativeElement, 'color', 'red');
  }
  // constructor(renderer: Renderer) {}
}

// Angular 2.0 supports 2 basic types of directives:
// - Component - the basic building blocks of Angular 2.0 apps. Backed by
//   ShadowDom.(http://www.html5rocks.com/en/tutorials/webcomponents/shadowdom/)
// - Directive - add behavior to existing elements.

// @Component is AtScript syntax to annotate the HelloCmp class as an Angular
// 2.0 component.
@Component(
    // The Selector prop tells Angular on which elements to instantiate this
    // class. The syntax supported is a basic subset of CSS selectors, for example
    // 'element', '[attr]', [attr=foo]', etc.
    selector: 'hello-app',
    // These are services that would be created if a class in the component's
    // template tries to inject them.
    viewProviders: const [GreetingService],
    // The template for the component.
    // Expressions in the template (like {{greeting}}) are evaluated in the
    // context of the HelloCmp class below.
    template:
        r'''<div class="greeting">{{greeting}} <span red>world</span>!</div>
           <button class="changeButton" (click)="changeGreeting()">change greeting</button>
           <div (keydown)="onKeyDown($event)" class="sample-area" tabindex="0">{{lastKey}}</div><br>''',
    // All directives used in the template need to be specified. This allows for
    // modularity (RedDec can only be used in this template)
    // and better tooling (the template can be invalidated if the attribute is
    // misspelled).
    directives: const [RedDec])
class HelloCmp {
  String greeting;
  String lastKey = '(none)';
  HelloCmp(GreetingService service) {
    this.greeting = service.greeting;
  }

  void changeGreeting() {
    greeting = 'howdy';
  }

  void onKeyDown(KeyboardEvent event) {
    lastKey = StringWrapper.fromCharCode(event.keyCode);
  }
}
