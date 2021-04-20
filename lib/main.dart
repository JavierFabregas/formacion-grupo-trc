import 'package:flutter/material.dart';


void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: FormPage(),
    );
  }
}

class FormPage extends StatefulWidget {
  const FormPage({
    Key key,
  }) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {

  String name = '';
  String password = '';
  bool hidePassword = true;
  bool _autovalidate = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        child: Form(
          key: _formKey,
          child: Container(
            height: 400,
            child: ListView(
              children: [
                SizedBox(height: 100,),
                FormInput(
                  labelText: 'Nombre completo',
                  hintText: 'Nombre',
                  autovalidate: _autovalidate,
                  onChanged: (String value) { name = value; },
                  validator: (String value) { 
                    if(value == ''){
                      return 'Este campo no debe estar vacío';
                    }
                    return null;
                   },
                ),
                SizedBox(height: 10,),
                FormInput(
                  hintText: 'Contraseña',
                  labelText: 'Contraseña',
                  autovalidate: _autovalidate,
                  obscureText: hidePassword,
                  onChanged: (String value) { password = value; },
                  validator: (String value) { 
                    if(value.length<6){
                      return 'La contraseña debe tener almenos 6 caracteres';
                    }
                    return null;
                   },
                   suffixIcon: IconButton(
                     icon: (hidePassword) ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                     onPressed: (){
                      setState(() {});
                      hidePassword = !hidePassword;
                      print(hidePassword);
                     }
                   ),
                ),
                SizedBox(height: 15,),
                ElevatedButton(
                  onPressed: () {
                    // if(_formKey.currentState.validate()){
                      print('El formulario es válido');
                      _autovalidate = true;
                      setState(() {});
                    // }
                  },
                  child: Text('Login')
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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

class TextoPersonalizado extends StatelessWidget {
  const TextoPersonalizado({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Hola mundo');
  }
}