String validatePassword(String value) { 
  if(value.length<6){
    return 'La contraseña debe tener almenos 6 caracteres';
  }
  return null;
}
String validateName(String value) { 
  if(value == ''){
    return 'Este campo no debe estar vacío';
  }
  return null;
}