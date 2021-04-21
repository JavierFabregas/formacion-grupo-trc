import 'package:ejericio_formacion/common/utils/validators.dart';

class FormBloc{
  String name = '';
  String password = '';

  onChangeName(String value) {
    name = value;
  } 

  onChangePassword(String value) {
    password = value;
  } 

  bool isFormValid() {
   return ((validateName(name) == null) &&
           (validatePassword(password) == null));
  } 

  postForm(){
    print('Name: $name');
    print('Password: $password');
  }

}