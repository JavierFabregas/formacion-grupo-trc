import 'package:ejericio_formacion/common/datasources/api/models/Person.dart';
import 'package:ejericio_formacion/common/routes.dart';
import 'package:ejericio_formacion/common/widgets/customDialog.dart';
import 'package:ejericio_formacion/common/widgets/customDialog2.dart';
import 'package:ejericio_formacion/features/people_list/people_list_bloc.dart';
import 'package:flutter/material.dart';


class PeopleListPage extends StatefulWidget {
  const PeopleListPage({Key key}) : super(key: key);

  @override
  _PeopleListPageState createState() => _PeopleListPageState();
}

class _PeopleListPageState extends State<PeopleListPage> {
  PeopleListBloc _bloc = PeopleListBloc();
  @override
  void initState() { 
    super.initState();
    _bloc.addNoItemsToList();
    _bloc.addItemsToList();
    _bloc.getPeople2();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.arrow_upward_sharp),
            onPressed: () { 
              Widget content = Container(
                height: 300,
                  child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // GestureDetector(
                        //   onTap: (){
                        //     Navigator.pop(context);
                        //   },
                        //   child: Icon(Icons.close)
                        // ),
                        IconButton(
                          icon: Icon(Icons.close),
                          onPressed: (){
                            Navigator.pop(context);
                          }
                        )
                      ],
                    ),
                    Text('Título del dialog', style: Theme.of(context).textTheme.headline1,),
                    SizedBox(height: 15,),
                    Text('Cuerpo del dialog', style: Theme.of(context).textTheme.bodyText1,),
                    SizedBox(height: 150,),
                    ElevatedButton(
                      child: Text('Enviar'),
                      onPressed: (){
                        Navigator.pop(context);
                      }
                    )
                  ],
                ),
              );
              customDialog2(context, content);
             },
          ),
          SizedBox(width: 15,),
          FloatingActionButton(
            child: Icon(Icons.arrow_downward_sharp),
            onPressed: () { 
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  action: SnackBarAction(
                    label: 'Volver',
                    textColor: Colors.black,
                    onPressed: () { 
                      Navigator.pop(context);
                     },
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                  content: Text('Mensaje informativo'),
                  duration: Duration(seconds: 5),
                )
              );
             },
          ),
        ],
      ),
      appBar: AppBar(
        leading: IconButton(
          icon:Icon(Icons.star),
          onPressed: () { 
            Navigator.pop(context);
           },
        ),
        title: Text('Listado de Personas', style: Theme.of(context).textTheme.headline1.copyWith(fontSize: 14),),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:15.0,right: 15),
        child: StreamBuilder(
          stream: _bloc.peopleRepo,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              List<PersonRepo> people = snapshot.data;
              if(people.isEmpty){
                return Center(child: Text('No hay resultados'),);
              }else{
                return ListView.builder(
                  itemCount: people.length,
                  itemBuilder: (BuildContext context, int index) { 
                    return PersonCard(
                      // person: Person(
                      //   name: 'Javier Fábregas',
                      //   email: 'Javier@fabregas.es',
                      //   imagen: 'https://www.turismoasturias.es/documents/11022/78698/Puente_Romano.jpg/2cb0bf5c-205c-4292-a965-c3f09e221912?t=1537515014585'
                      // ),
                      person: people[index]
                    );
                  },
                );
              }
            }else{
              return Center(child: CircularProgressIndicator(),);
            }
          }
        ),
      ),
    );
  }
}

class PersonCard extends StatelessWidget {
  const PersonCard({
    Key key,@required this.person,
  }) : super(key: key);
  final PersonRepo person;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, Routes.personPage, arguments: {'person':person});
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:15.0, vertical:10),
          child: Row(
            children: [
              Container(
                height: 65,
                width: 65,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    person.avatar,
                    fit: BoxFit.cover,
                  )
                )
              ),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 200,
                    child: Text(
                      person.email,
                      style: Theme.of(context).textTheme.headline1.copyWith(fontSize: 17),
                      overflow: TextOverflow.clip,
                      softWrap: false,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: 200,
                    child: Text(
                      '${person.firstName} ${person.lastName} ${person.firstName} ${person.lastName} ${person.firstName} ${person.lastName} ${person.firstName} ${person.lastName} ${person.firstName} ${person.lastName}',
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      // maxLines: 300,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Person{
  String name;
  String email;
  String imagen;

  Person({String name, String email, String imagen}){
    this.name = name;
    this.email = email;
    this.imagen = imagen;
  }
}