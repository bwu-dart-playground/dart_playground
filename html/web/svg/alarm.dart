library x;

import 'dart:html';
import 'dart:svg' as svg;

void main() {
  document.querySelector('#circle').style.setProperty('fill', 'none');
  Symbol x = #main;

  svg.EllipseElement ell = document.querySelector('#ellipse');
  svg.AnimateTransformElement t = new svg.AnimateTransformElement();
  print (svg.AnimateTransformElement.supported);
  ell.style.setProperty('fill', '#07f');
  //ell.style.fi = "#0077FF";
  //ell.attributes['transform'] = "translate(150,150)";
  //var te = new svg.AnimateTransformElement();
  //te.targetElement = ell;
//  te.setAttribute('type', 'translate');
//  te.setAttribute('from', '0,0');
//  te.setAttribute('to', '90,45');
//  te.setAttribute('begin', '1s');
//  te.setAttribute('dur', '5s');
//  te.setAttribute('fill', 'freeze');
  //ell.append(te); // this attempt didn't work

  //var tr = ell.transform.baseVal.first.setTranslate(20, 100);
  svg.Matrix m = new svg.SvgSvgElement().createSvgMatrix();
  svg.Matrix m2 = m.translate(-25, 25);
 svg.Transform tr = ell.transform.baseVal.createSvgTransformFromMatrix(m2);
 ell.transform.baseVal.appendItem(tr);

  //var tr = ell.transform;
}

