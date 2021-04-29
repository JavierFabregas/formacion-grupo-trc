import 'package:flutter/material.dart';


class Body1 extends StatelessWidget {
  const Body1({
    Key key,@required this.onPressed,
  }) : super(key: key);
  final Function(String) onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[200],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: Text('Página 0'),
          ),
          ElevatedButton(
            onPressed:() => onPressed('Página 0'),
            child: Text('Cambiar nombre'),
          )
        ],
      ),
    );
  }
}