import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Body3 extends StatefulWidget {
  const Body3({
    Key key,
  }) : super(key: key);

  @override
  _Body3State createState() => _Body3State();
}

class _Body3State extends State<Body3> {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  final _history = [];
  StreamSubscription<String> _onUrlChanged;
  @override
  void initState() { 
    super.initState();
    _onUrlChanged = flutterWebviewPlugin.onUrlChanged.listen((String url) {
      if(mounted){
        _history.add('On url changed: $url');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          child: WebviewScaffold(
            url: 'https://pub.dev/packages/flutter_webview_plugin/install',
            initialChild: Container(
              color: Colors.redAccent,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            persistentFooterButtons: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  flutterWebviewPlugin.goBack();
                },
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  flutterWebviewPlugin.goForward();
                },
              ),
              IconButton(
                icon: const Icon(Icons.autorenew),
                onPressed: () {
                  flutterWebviewPlugin.reload();
                },
              ),
              IconButton(
                icon: const Icon(Icons.list_sharp),
                onPressed: () {
                  print(_history.toString());
                },
              ),
            ],
          ),
        ),
        SizedBox(height: 30,),
        Text('Debajo del web view')
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _onUrlChanged.cancel();
  }
}