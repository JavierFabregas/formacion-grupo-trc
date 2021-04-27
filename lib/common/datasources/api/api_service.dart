import 'package:ejericio_formacion/common/datasources/Prefs.dart';
import 'package:http/http.dart' as http;

class ApiService{
  final http.Client _client = http.Client();
  static const int DURATION  = 15;

  Future<Map<String,String>> getHeaders() async{
    return {
      "Content-Type":"application/json",
      "Authorization": "${await Prefs.getToken()}"
    };
  }

  Uri getCompleteURL(String endpoint){
    String url = 'baseurl$endpoint';
    print(url);
    return Uri.parse(url);
  }

  

}