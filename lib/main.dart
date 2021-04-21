import 'package:ejericio_formacion/common/routes.dart';
import 'package:ejericio_formacion/features/form/form_page.dart';
import 'package:ejericio_formacion/features/splash/splash_page.dart';
import 'package:flutter/material.dart';
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      // home: SplashPage(),
      initialRoute: Routes.splashPage,
      routes: Routes.all,
    );
  }
}