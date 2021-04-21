import 'package:flutter/material.dart';

class MaquetacionPage extends StatelessWidget {
  const MaquetacionPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Obtención de un objeto size (height y width) que contiene las medidas en píxeles de la pantalla
    // MediaQuery.of(context).size.height
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            child: Image.network(
              'https://www.turismoasturias.es/documents/11022/78698/Puente_Romano.jpg/2cb0bf5c-205c-4292-a965-c3f09e221912?t=1537515014585',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:15.0, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Cangas de Onís',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                    SizedBox(height: 8,),
                    Text('Asturias',style: TextStyle(fontSize: 18, color: Color.fromRGBO(0, 0, 0, 0.5))),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.star,color: Colors.yellow, size: 30,),
                    Text('4.9/5'),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}