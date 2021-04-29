import 'package:ejericio_formacion/features/bottom_nav_bar/page_1_content/page_1_content.dart';
import 'package:ejericio_formacion/features/bottom_nav_bar/page_2_content/page_2_content.dart';
import 'package:ejericio_formacion/features/bottom_nav_bar/page_3_content/page_3_content.dart';
import 'package:ejericio_formacion/features/bottom_nav_bar/page_4_content/page_3_content.dart';
import 'package:flutter/material.dart';

class BottomNavBarPage extends StatefulWidget {
  BottomNavBarPage({Key key}) : super(key: key);

  @override
  _BottomNavBarPageState createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  int _index = 0;
  Widget content;
  String title = 'Bottom nav bar';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setContent(_index);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.green,
        selectedItemColor: Colors.orange,
        onTap: (int i){
          _index = i;
          print(_index);
          setState(() {});
          setContent(_index);
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            // label: 'Home',
            title: SizedBox.shrink(),
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
            // label: 'Home',
            title: SizedBox.shrink(),
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
            // label: 'Home',
            title: SizedBox.shrink(),
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
            // label: 'Home',
            title: SizedBox.shrink(),
            icon: Icon(Icons.home)
          ),
        ]
      ),
    );
  }

  setContent(int index){
    switch (index) {
      case 0:
        content = Body1(
          onPressed: (value){
            title = value;
            setState(() {});
          },
        );
        break;
      case 1:
        content = Body2();
        break;
      case 2:
        content = Body3();
        break;
      case 3:
        content = Body4();
        break;
      default:
    }
  }
}
