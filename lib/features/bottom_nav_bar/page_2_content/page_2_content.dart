import 'package:flutter/material.dart';


class Body2 extends StatelessWidget {
  const Body2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange[200],
      child: Center(child: CircularProgressIndicator(),),
    );
  }
}