//import 'dart:html';
//import 'package:js/js.dart' as js;
//import 'dart:async';
//import 'dart:js';
//
//List<Map<String, String >> word_map;
//
//void main() {
//   draw_visualization();
//}
//
//void draw_visualization(){
//   word_map =new List<Map<String,String>>();
//
//
//word_map= [{'word':'hello','x':30.0,'y':20.0, 'fixed':false}];
//  JsObject word_list_js = new JsObject.jsify(word_map);
//  js.context.console.log(word_list_js);
//
//  print ("Made it here first");
//  var force = d3.layout.force()
//      .nodes(word_list_js)
//      .links(js.array([]))
//      .size([600,400]);
//      /* .start();
//
//
// var chart = d3.select("body")
//      .append("svg")
//      .attr('width', 600)
//      .attr('height', 400);
//
//
//  var node = chart.selectAll('.node')
//        .data(word_list_js).enter().append('circle')
//        .attr('class','node')
//        .attr('r', 5)
//        .attr('cx', new js.FunctionProxy((d,i,e){return d.x;}))
//        .attr('cy',new js.FunctionProxy((d,i,e){return d.y;}))
//        .style('fill', 'blue')
//
//
//
//
//
//
//  force.on('tick', new js.FunctionProxy((e){
//
//
//    node.attr("cx", new js.FunctionProxy((d,i,e){
//            if (d.x > 0 && d.x<4000){print(d.x);}
//              return d.x;
//            }))
//        .attr("cy", new js.FunctionProxy((d,i,e){
//              return d.y;
//            })
//        );
//
//  }));
//*/
//}