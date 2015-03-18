library x;

import 'dart:html';
import 'dart:svg' as svg;

void main() {
  var svgElement = document.querySelector('#svg');
  Symbol x = #main;



  ImageElement img = new ImageElement(src:'http://cdn.overclock.net/1/14/14e0d3f6_vbattach215192.jpeg'); //401x600
  img.onLoad.listen((e) {
    svg.ImageElement image = new svg.ImageElement();
    image.setAttribute('x', '0');
    image.setAttribute('y', '0');
    image.setAttribute('width', img.width.toString());
    image.setAttribute('height', img.height.toString());
    image.getNamespacedAttributes('http://www.w3.org/1999/xlink')['href'] = 'http://cdn.overclock.net/1/14/14e0d3f6_vbattach215192.jpeg';
    svgElement.append(image);
  });


  //document.body.append(img);

}

