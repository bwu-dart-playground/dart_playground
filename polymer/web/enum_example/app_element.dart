import 'package:polymer/polymer.dart';
import 'dart:html' as html;

/**
 * A Polymer app-element element.
 */
@CustomTag('app-element')
class AppElement extends PolymerElement {

  /// Constructor used to create instance of AppElement.
  AppElement.created() : super.created() {
    new html.Text('xxx');
    html.Element
  }

  @published
  Map itemList = {Categoria.ID: 'id', Categoria.DESCRICAO: 'descricao', Categoria.NATUREZA: 'natureza'};

  Categoria categoriaEnum(String val) =>
    Categoria.values.firstWhere((i) => '${i}'.toString().toLowerCase().endsWith('.${val.toLowerCase()}'));
}

class Static {
  static final int x = 0;
}

enum Categoria {ID, DESCRICAO, NATUREZA, ID_SUBCATEGORIA_DA, DESCRICAO_SUBCATEGORIA_DA, ATIVO}
