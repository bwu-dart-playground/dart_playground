import 'package:di/di.dart';
import 'package:di/dynamic_injector.dart';

abstract class BaseObject /*with GuiAttributes*/ {
  Map properties = {
    "top": 0.0,
    "left": 0.0
  };
}

class RectObject extends BaseObject {
  // width, height
}

class ImageObject extends RectObject {
  RectObject rect;

  ImageObject(this.rect);
}

class CircleObject extends BaseObject {
  // radius
}

abstract class GuiAttributes {
  bool showProperties = true;
}

class ExtendedRectObject = RectObject with GuiAttributes;
class ExtendedCircleObject = CircleObject with GuiAttributes;
class ExtendedImageObject = ImageObject with GuiAttributes;

class RuntimeModule extends Module {
  static Injector _injector;
  Injector get injector {
   if (_injector == null) {
     _injector = new DynamicInjector(modules: [this]);
    }
   return _injector;
 }

  RuntimeModule() {
    bind(BaseObject);
  }
}

class DesignerModule extends Module {
  static Injector _injector;
  Injector get injector {
     if (_injector == null) {
       _injector = new DynamicInjector(modules: [this]);
      }
     return _injector;
   }

  DesignerModule() {
    bind(CircleObject, toImplementation: ExtendedCircleObject);
    bind(RectObject, toImplementation: ExtendedRectObject);
    bind(ImageObject, toImplementation: ExtendedImageObject);
  }
}

void main() {
  var rtInj = new RuntimeModule().injector;
  var guiInj = new DesignerModule().injector;

  print("Object: " + rtInj.get(ImageObject).toString());
  print("Object: " + (guiInj.get(Object) as ExtendedCircleObject).showProperties.toString());
  print("Object: " + (guiInj.get(ImageObject) as ExtendedImageObject).rect.toString());
}