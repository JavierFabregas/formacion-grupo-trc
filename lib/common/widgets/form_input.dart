import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  const FormInput({
    Key key,
    @required this.labelText,
    @required this.hintText,
    @required this.onChanged,
    @required this.validator,
    @required this.autovalidate,
    this.suffixIcon,
    this.obscureText = false,
  }) : super(key: key);
  final String labelText;
  final String hintText;
  final Function(String) onChanged;
  final Function(String) validator;
  final Widget suffixIcon;
  final bool obscureText;
  final bool autovalidate;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      autovalidateMode: (autovalidate) ? AutovalidateMode.always : AutovalidateMode.disabled,
      decoration: InputDecoration(
        hintText: 'Nombre',
        labelText: labelText,
        suffixIcon: 
          (suffixIcon==null)
            ? SizedBox.shrink()
            : suffixIcon,
        border: OutlineInputBorder(
          borderSide: BorderSide(color:Colors.blue, width: 4)
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color:Colors.green, width: 4)
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color:Colors.blue, width: 4)
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color:Colors.red, width: 4)
        ),
      ),
    );
  }
}
