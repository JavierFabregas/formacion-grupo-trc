import 'package:ejericio_formacion/common/datasources/Prefs.dart';
import 'package:ejericio_formacion/common/routes.dart';
import 'package:ejericio_formacion/common/utils/validators.dart';
import 'package:ejericio_formacion/common/widgets/form_input.dart';
import 'package:ejericio_formacion/features/form/form_bloc.dart';
import 'package:flutter/material.dart';


class FormPage extends StatefulWidget {
  const FormPage({
    Key key,
  }) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {

  bool hidePassword = true;
  bool _autovalidate = false;
  FormBloc _bloc = new FormBloc();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        child: Container(
          height: 400,
          child: ListView(
            children: [
              SizedBox(height: 100,),
              FormInput(
                labelText: 'Nombre completo',
                hintText: 'Nombre',
                autovalidate: _autovalidate,
                onChanged: _bloc.onChangeName,
                validator: validateName,
              ),
              SizedBox(height: 10,),
              FormInput(
                hintText: 'Contraseña',
                labelText: 'Contraseña',
                autovalidate: _autovalidate,
                obscureText: hidePassword,
                onChanged: _bloc.onChangePassword,
                validator: validatePassword,
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
                  if(_bloc.isFormValid()){
                    _bloc.postForm();
                    Prefs.setToken('TOKEN DE EJEMPLO');
                    Navigator.pushReplacementNamed(context, Routes.maquetacionPage);
                  }else{
                    _autovalidate = true;
                    setState(() {});
                  }
                },
                child: Text('Login')
              )
            ],
          ),
        ),
      ),
    );
  }
}