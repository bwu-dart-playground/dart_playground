import 'package:flutter/material.dart';

void main() {
  runApp(
    new MaterialApp(
      title: "Flutter Demo",
      routes: {
        '/': (RouteArguments args) => new FlutterDemo()
      }
    )
  );
}

class FlutterDemo extends StatelessComponent {
  Widget build(BuildContext context)  {
    return new Scaffold(
      toolBar: new ToolBar(
        center: new Text("Flutter Demo")
      ),
      body: new Material(
        child: new Center(
          child: new Text("Hello world!")
        )
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(
          icon: 'content/add'
        )
      )
    );
  }
}
