import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';


class Body4 extends StatefulWidget {
  const Body4({
    Key key,
  }) : super(key: key);

  @override
  _Body4State createState() => _Body4State();
}

class _Body4State extends State<Body4> {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink[200],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: (){
                flutterWebviewPlugin.launch(
                  'google.es',
                  // fullScreen: false,
                  rect: new Rect.fromLTWH(
                    0.0,
                    150.0,
                    MediaQuery.of(context).size.width,
                    300.0,
                  ),
                );
                },
                child: Text('WebView')
              ),
              ElevatedButton(
                onPressed: (){
                  flutterWebviewPlugin.close();
                },
                child: Text('Cerrar')
              )
            ],
          ),
        ],
      ),
    );
  }
}

