import 'package:ejericio_formacion/common/datasources/api/models/Person.dart';
import 'package:ejericio_formacion/common/datasources/database/db_service.dart';
import 'package:flutter/material.dart';
class PersonPage extends StatefulWidget {
  PersonPage({Key key}) : super(key: key);

  @override
  _PersonPageState createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  Map<String,dynamic> _args;
  PersonRepo person;
  PersonRepo personDB;
  bool isFavourite = false;
  @override
  void initState() { 
    super.initState();
    
  } 

  initializers()async{
    if(_args != null){
      person = _args['person'] ?? PersonRepo();
      await DBService.db.getPersonById(person.id).then((value) {
        if(value!=null){
          isFavourite = true;
          personDB = value;
          setState(() {});
        }
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    _args = ModalRoute.of(context).settings.arguments;
    initializers();
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
                person.avatar,
                fit: BoxFit.cover,
              )
            )
          ),
          Column(
            children: [
              Text(person.email,style: Theme.of(context).textTheme.headline1.copyWith(fontSize: 25)),
              SizedBox(height: 20,),
              Text('${person.firstName} ${person.lastName}',style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 20)),
            ],
          ),
          ElevatedButton(
            onPressed: ()async{
              if(!isFavourite){
                await DBService.db.addnewPerson(person);
                isFavourite = true;
                setState((){});
              }else{
                print('Person id: ${person.id}');
                await DBService.db.deletePerson(person.id);
                isFavourite = false;
                setState((){});
              }
            },
            child: Text((!isFavourite) ? 'Añadir a favoritos' : 'Quitar de favoritos')
          ),
          Container(width: double.infinity,),
        ],
      )
    );
  }
}