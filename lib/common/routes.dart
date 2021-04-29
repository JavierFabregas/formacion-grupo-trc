import 'package:ejericio_formacion/features/bottom_nav_bar/bottom_nav_bar_page.dart';
import 'package:ejericio_formacion/features/form/form_page.dart';
import 'package:ejericio_formacion/features/maquetacion/maquetacion_page.dart';
import 'package:ejericio_formacion/features/people_list/people_list_page.dart';
import 'package:ejericio_formacion/features/person/person_page.dart';
import 'package:ejericio_formacion/features/splash/splash_page.dart';
import 'package:flutter/material.dart';

class Routes{
  static final formPage = 'FormPage';
  static final splashPage = 'splashPage';
  static final maquetacionPage = 'MaquetacionPage';
  static final peopleListPage = 'PeopleListPage';
  static final personPage = 'PersonPage';
  static final bottomNavBarPage = 'BottomNavBarPage';

  static final all = <String, WidgetBuilder>{
    Routes.formPage: (BuildContext context) => FormPage(),
    Routes.splashPage: (BuildContext context) => SplashPage(),
    Routes.maquetacionPage: (BuildContext context) => MaquetacionPage(),
    Routes.peopleListPage: (BuildContext context) => PeopleListPage(),
    Routes.personPage: (BuildContext context) => PersonPage(),
    Routes.bottomNavBarPage: (BuildContext context) => BottomNavBarPage(),
  };
}