import 'package:flutter/material.dart';

customDialog2(BuildContext context, Widget content){
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context){
      return SingleChildScrollView(
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          content: content,
        ),
      );
    }
  );
}