import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Body1 extends StatefulWidget {
  const Body1({
    Key key,
  }) : super(key: key);

  @override
  _Body1State createState() => _Body1State();
}

class _Body1State extends State<Body1> {

  File _image;
  String _path;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[200],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 150,
            width: 150,
            child: 
              (_image == null)
                ? Image.network('https://icon-library.com/images/loading-icon-transparent-background/loading-icon-transparent-background-12.jpg')
                : Image.file(_image, fit: BoxFit.cover,)
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: (){
                  getImage(true);
                },
                child: Text('Galería')
              ),
              ElevatedButton(
                onPressed: (){
                  getImage(false);
                },
                child: Text('Cámara')
              ),
            ],
          ),
          SizedBox(width: double.infinity,)
        ],
      ),
    );
  }

  getImage(bool isGallery)async{
    final pickedFile = await picker.getImage(source: (isGallery) ? ImageSource.gallery : ImageSource.camera);
    _image = null;
    if(pickedFile != null){
      _image = File(pickedFile.path);
      
      _path = pickedFile.path;
      print('Path: $_path, image: ${_image.toString()}');
      setState(() {});
    }else{
      print('No se ha seleccionado ninguna imagen');
    }
  }
}