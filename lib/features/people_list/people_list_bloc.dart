import 'package:ejericio_formacion/features/people_list/people_list_page.dart';
import 'package:rxdart/rxdart.dart';

class PeopleListBloc{
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

  dispose(){
    _publishSubject.close();
  }

}