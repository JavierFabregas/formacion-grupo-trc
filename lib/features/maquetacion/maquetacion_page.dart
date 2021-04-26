import 'package:ejericio_formacion/common/assets.dart';
import 'package:ejericio_formacion/common/datasources/Prefs.dart';
import 'package:ejericio_formacion/common/routes.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

class MaquetacionPage extends StatefulWidget {
  MaquetacionPage({Key key}) : super(key: key);

  @override
  _MaquetacionPageState createState() => _MaquetacionPageState();
}

class _MaquetacionPageState extends State<MaquetacionPage> {
  String appName = '';
  String packageName = '';
  String version = '';
  String buildNumber = '';

  setVersionText()async{
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appName = packageInfo.appName;
    packageName = packageInfo.packageName;
    version = packageInfo.version;
    buildNumber = packageInfo.buildNumber;
    setState(() {});
  }

  @override
  void initState() { 
    super.initState();
    setVersionText();
  }

  @override
  Widget build(BuildContext context) {

    // Obtención de un objeto size (height y width) que contiene las medidas en píxeles de la pantalla
    // MediaQuery.of(context).size.height
    List<String> images = [Assets.image1,Assets.image2,Assets.image3,Assets.image4,];
    return WillPopScope(
        onWillPop: () { 
          print('Seguro que quieres cerrar la aplicación');
          return Future.value(false);
         },
        child: Scaffold(
        appBar: AppBar(
          title: Text('Maquetación', style: Theme.of(context).textTheme.headline1,),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Center(
                  child: Text('Ejercicio formación',style: Theme.of(context).textTheme.headline2.copyWith(color:Colors.black)),
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.purpleAccent,
                      Colors.red
                    ]
                  )
                ),
              ),
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Ver listado', style: Theme.of(context).textTheme.bodyText2,),
                    Icon(Icons.arrow_forward_ios_outlined)
                  ],
                ),
                onTap: () {
                  Navigator.pushNamed(context, Routes.peopleListPage);
                },
              ),
              ListTile(
                title: Text('Cerrar sesión', style: Theme.of(context).textTheme.bodyText2,),
                onTap: (){
                  Prefs.setToken('');
                  Navigator.pushReplacementNamed(context, Routes.formPage);
                },
              ),
              Center(child: Text('$version + $buildNumber', style: Theme.of(context).textTheme.bodyText2,)),
            ],
          ),
        ),
        body: ListView(
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
                      Text('Cangas de Onís',style: Theme.of(context).textTheme.headline1),
                      SizedBox(height: 8,),
                      Text('Asturias',style: Theme.of(context).textTheme.bodyText2),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.star,color: Colors.yellow, size: 30,),
                      Text('4.9/5',style: Theme.of(context).textTheme.bodyText2),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconText(icon: Icons.phone, text:'Teléfono'),
                IconText(icon: Icons.location_on, text:'Ubicación'),
                IconText(icon: Icons.share, text:'Compartir'),
              ],
            ),
            Container(
              height: 250,
              child: ListView.builder(
                itemCount: images.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) { 
                  return ImageCard(image: images[index],);
                 },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam in felis aliquam, consequat lectus sed, interdum nunc. In pellentesque lectus eu congue ultrices. Integer dictum risus ac tortor malesuada, ac varius eros fermentum. Aliquam leo tortor, commodo et nunc sit amet, ultricies sagittis nisl. Fusce lectus ipsum, fringilla eu tincidunt bibendum, suscipit non turpis. Fusce fermentum sodales lorem ac ultrices. Nam tristique, ante vitae elementum condimentum, est mauris sagittis ligula, sit amet rhoncus enim tortor id nisl. Nulla nunc quam, dictum quis erat in, tristique dictum ligula. Vivamus finibus nulla sed sapien gravida blandit ac posuere eros. Morbi a auctor velit. Fusce tristique enim eget scelerisque euismod. Etiam iaculis orci sed molestie condimentum.',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                onTap: (){
                  Prefs.setToken('');
                  Navigator.pushReplacementNamed(context, Routes.formPage);
                },
                child: Text('Cerrar sesión')
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  const ImageCard({
    Key key, @required this.image,
  }) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 250,
        width: 250,
        child: Card(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20) ,
            child: Image(image: AssetImage(image), fit: BoxFit.cover,)
          )
        ),
      ),
    );
  }
}

// Tarjetas con diseño concreto
class ImageCard2 extends StatelessWidget {
  const ImageCard2({
    Key key, @required this.image,
  }) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Theme(
        data: ThemeData(
          cardTheme: CardTheme(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            )
          )
        ),
        child: Container(
          height: 250,
          width: 250,
          child: Card(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20) ,
              child: Image(image: AssetImage(image), fit: BoxFit.cover,)
            )
          ),
        ),
      ),
    );
  }
}

class IconText extends StatelessWidget {
  const IconText({
    Key key,@required this.text,@required this.icon,
  }) : super(key: key);
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Theme.of(context).primaryColor, size: 40,),
        SizedBox(height: 5,),
        Text(text, style: Theme.of(context).textTheme.headline2)
      ],
    );
  }
}