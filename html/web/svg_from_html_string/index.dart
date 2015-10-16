import 'dart:html';
import 'dart:svg';

void main() {
  SvgSvgElement svg = new SvgSvgElement();
  document.body.append(svg);
  SvgElement defsElement = new SvgElement.tag('defs');
  svg.append(defsElement);
  var str = '''
<linearGradient id="grad2" x1="0%" y1="0%" x2="0%" y2="100%">
      <stop offset="0%" style="stop-color:rgb(255,0,0);stop-opacity:1"></stop>
      <stop offset="100%" style="stop-color:rgb(255,255,0);stop-opacity:1"></stop>
    </linearGradient>
      ''';

  Element element = new Element.html(
      str,
      validator: new NodeValidatorBuilder()
        ..allowElement('lineargradient', attributes: ['id', 'x1', 'y1', 'x2', 'y2'])
        ..allowElement('stop', attributes: ['offset', 'stop-color', 'stop-opacity', 'style'])
  );

  defsElement.append(element);
  var ellipse = new Element.html('<ellipse cx="200" cy="70" rx="85" ry="55" fill="url(#grad2)"></ellipse>', validator: new NodeValidatorBuilder()
          ..allowElement('ellipse', attributes: ['cx', 'cy', 'rx', 'ry', 'fill']));
  svg.append(ellipse);
}
