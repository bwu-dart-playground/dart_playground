import 'dart:js';
import 'dart:html';

main() {
    int pagenumber = 5;
    context['Window']['text$pagenumber'] = 123;
    window.alert('${context['Window']['text$pagenumber']}');
}
