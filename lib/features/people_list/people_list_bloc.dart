import 'package:ejericio_formacion/common/datasources/api/api_service.dart';
import 'package:ejericio_formacion/features/people_list/people_list_page.dart';
import 'package:ejericio_formacion/common/datasources/api/models/Person.dart';
import 'package:rxdart/rxdart.dart';

class PeopleListBloc{

  ApiService api = ApiService();

  List<Person> _people = [
    Person(name: 'Javi Fábregas 0', email: 'george.bluth@reqres.in',  imagen: 'https://reqres.in/img/faces/1-image.jpg'),
    Person(name: 'Javi Fábregas 1', email: 'george.bluth@reqres.in',  imagen: 'https://reqres.in/img/faces/1-image.jpg'),
    Person(name: 'Javi Fábregas 2', email: 'george.bluth@reqres.in',  imagen: 'https://reqres.in/img/faces/1-image.jpg'),
    Person(name: 'Javi Fábregas 3', email: 'george.bluth@reqres.in',  imagen: 'https://reqres.in/img/faces/1-image.jpg'),
    Person(name: 'Javi Fábregas 4', email: 'george.bluth@reqres.in',  imagen: 'https://reqres.in/img/faces/1-image.jpg'),
    Person(name: 'Javi Fábregas 5', email: 'george.bluth@reqres.in',  imagen: 'https://reqres.in/img/faces/1-image.jpg'),
    Person(name: 'Javi Fábregas 6', email: 'george.bluth@reqres.in',  imagen: 'https://reqres.in/img/faces/1-image.jpg'),
    Person(name: 'Javi Fábregas 7', email: 'george.bluth@reqres.in',  imagen: 'https://reqres.in/img/faces/1-image.jpg'),
    Person(name: 'Javi Fábregas 8', email: 'george.bluth@reqres.in',  imagen: 'https://reqres.in/img/faces/1-image.jpg'),
    Person(name: 'Javi Fábregas 9', email: 'george.bluth@reqres.in',  imagen: 'https://reqres.in/img/faces/1-image.jpg'),
    Person(name: 'Javi Fábregas 10', email: 'george.bluth@reqres.in', imagen: 'https://reqres.in/img/faces/1-image.jpg'),
  ];

  PublishSubject<List<Person>> _publishSubject = PublishSubject<List<Person>>();
  Stream<List<Person>> get people => _publishSubject.stream;

  addItemsToList(){
    Future.delayed(Duration(milliseconds: 10000), (){
      _publishSubject.sink.add(_people);
    });
  }

  addNoItemsToList(){
    Future.delayed(Duration(milliseconds: 5000), (){
      _publishSubject.sink.add([]);
    });
  }

  
  PublishSubject<List<PersonRepo>> _publishSubjectRepo = PublishSubject<List<PersonRepo>>();
  Stream<List<PersonRepo>> get peopleRepo => _publishSubjectRepo.stream;

  getPeople()async{
    Future<List<PersonRepo>> people = api.getPeople();
    _publishSubjectRepo.sink.add(await people);
  }
  // List<PersonRepo> listaConTodos = [];
  getPeople2()async{
    Map<String,dynamic> response = await api.getPeople2();
    if(response['status'] == 200){
      List<PersonRepo> people = response['body'];
      // listaConTodos.addAll(people);
      // _publishSubjectRepo.sink.add(listaConTodos);
      _publishSubjectRepo.sink.add(people);
    }
  }

  dispose(){
    _publishSubject.close();
    _publishSubjectRepo.close();
  }

}