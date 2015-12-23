library angular2_examples.material.demo_common;

import 'package:angular2/platform/browser_static.dart';
import 'package:angular2/compiler.dart';

void commonDemoSetup() {
  BrowserDomAdapter.makeCurrent();
}

class DemoUrlResolver extends UrlResolver {
  @override
  String resolve(String baseUrl, String url) {
    const MATERIAL_PKG = 'package:angular2_material/';

    // We run a proxy server in front of pub serve that prepends "example" to
    // paths
    if (url.startsWith(MATERIAL_PKG)) {
      return '/examples/packages/angular2_material/' +
          url.substring(MATERIAL_PKG.length);
    }
    return super.resolve(baseUrl, url);
  }
}
