import 'package:ejericio_formacion/common/routes.dart';
import 'package:ejericio_formacion/features/form/form_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 2000), (){
      // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => FormPage()));
      Navigator.pushReplacementNamed(context, Routes.maquetacionPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SizedBox(width: double.infinity,),
            Container(
              width: 250,
              height: 250,
              child: Image.network(
                'https://media-exp1.licdn.com/dms/image/C4E0BAQHIZ3_quPTw5g/company-logo_200_200/0/1616743956398?e=2159024400&v=beta&t=1vRyXYXYq-uXcesUTnEHydCWEjUm6HEhAR1BuBsw1kk',
                fit: BoxFit.cover,
                ),
            ),
            SizedBox(height: 20,),
            Text('Grupo TRC.', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}