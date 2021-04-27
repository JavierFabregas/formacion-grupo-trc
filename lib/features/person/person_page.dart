import 'package:ejericio_formacion/features/people_list/people_list_page.dart';
import 'package:flutter/material.dart';
class PersonPage extends StatefulWidget {
  PersonPage({Key key}) : super(key: key);

  @override
  _PersonPageState createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  Map<String,dynamic> _args;
  Person person;
  @override
  Widget build(BuildContext context) {
    _args = ModalRoute.of(context).settings.arguments;
    if(_args != null){
      person = _args['person'] ?? Person();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 150,
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                person.imagen,
                fit: BoxFit.cover,
              )
            )
          ),
          Column(
            children: [
              Text(person.email,style: Theme.of(context).textTheme.headline1.copyWith(fontSize: 25)),
              SizedBox(height: 20,),
              Text(person.name,style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 20)),
            ],
          ),
          Container(width: double.infinity,),
        ],
      )
    );
  }
}