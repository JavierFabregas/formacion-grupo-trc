import 'package:flutter/material.dart';

customDialog(BuildContext context){
  showDialog(
    barrierDismissible: false,
    barrierColor: Colors.green[200],
    context: context,
    builder: (BuildContext context){
      return AlertDialog(
        title: Text('Título del alert'),
        content: Container(
          height: 100,
          child: Column(
            children: [
              Text('data'),
              Text('data'),
              Text('data'),
              Text('data'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: Text('Cerrar')
          ),
          TextButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: Text('Cerrar')
          ),
        ],
      );
    }
  );
}