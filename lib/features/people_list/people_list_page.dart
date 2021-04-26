import 'package:ejericio_formacion/common/routes.dart';
import 'package:flutter/material.dart';


class PeopleListPage extends StatelessWidget {
  const PeopleListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon:Icon(Icons.star),
          onPressed: () { 
            Navigator.pop(context);
           },
        ),
        title: Text('Listado de Personas', style: Theme.of(context).textTheme.headline1.copyWith(fontSize: 14),),
      ),
      body: Center(
        child: Text('Listado')
      ),
    );
  }
}