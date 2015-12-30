library my.lib;

import 'dart:mirrors' as m;

class MyAnnotation {
	const MyAnnotation();
}

@MyAnnotation()
String func(arg1, arg2) => print("test");

main() {
    List<m.DeclarationMirror> routines = m.currentMirrorSystem().findLibrary(#my.lib).declarations.values
      .where((m.DeclarationMirror dm) =>
        dm is m.MethodMirror && dm.metadata.map((m.InstanceMirror im) => im.reflectee)
            .any((refl) => refl is MyAnnotation)
      ).toList();
     // this works all ok
  m.MethodMirror f = routines[0];
    (f.owner as m.LibraryMirror).invoke(f.simpleName, ['a', 'b']);
}
