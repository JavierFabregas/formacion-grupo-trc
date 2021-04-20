import 'package:flutter/material.dart';


void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: FormPage(),
    );
  }
}

class FormPage extends StatelessWidget {
  const FormPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: ListView(
        children: [
          TextoPersonalizado(),
          TextoPersonalizado(),
          TextoPersonalizado(),
          TextoPersonalizado(),
          TextoPersonalizado(),
          TextoPersonalizado(),
          TextoPersonalizado(),
          TextoPersonalizado(),
          TextoPersonalizado(),
          TextoPersonalizado(),
          TextoPersonalizado(),
          TextoPersonalizado(),
          TextoPersonalizado(),
          TextoPersonalizado(),
          TextoPersonalizado(),
          TextoPersonalizado(),
          TextoPersonalizado(),
          TextoPersonalizado(),
          TextoPersonalizado(),
          TextoPersonalizado(),
          TextoPersonalizado(),
          TextoPersonalizado(),
          TextoPersonalizado(),
          TextoPersonalizado(),
          TextoPersonalizado(),
          TextoPersonalizado(),
          TextoPersonalizado(),
          TextoPersonalizado(),
          TextoPersonalizado(),
          TextoPersonalizado(),
          TextoPersonalizado(),
          TextoPersonalizado(),
          TextoPersonalizado(),
          TextoPersonalizado(),
        ],
      ),
    );
  }
}

class TextoPersonalizado extends StatelessWidget {
  const TextoPersonalizado({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Hola mundo');
  }
}