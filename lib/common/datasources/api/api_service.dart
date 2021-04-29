import 'dart:convert';

import 'package:ejericio_formacion/common/datasources/Prefs.dart';
import 'package:ejericio_formacion/common/datasources/api/models/PeoplePage.dart';
import 'package:ejericio_formacion/common/datasources/api/models/Person.dart';
import 'package:ejericio_formacion/environment.dart';
import 'package:http/http.dart' as http;

class ApiService{
  final http.Client _client = http.Client();
  static const int DURATION  = 15;

  Future<Map<String,String>> _getHeaders() async{
    return {
      "Content-Type":"application/json",
      "Authorization": "${await Prefs.getToken()}"
    };
  }

  Uri _getCompleteURL(String endpoint){
    String baseUrl = Environment.baseUrl;
    String url = '$baseUrl$endpoint';
    print(url);
    return Uri.parse(url);
  }

  Future<List<PersonRepo>> getPeople()async{
    var response = await _client.get(_getCompleteURL('users?per_page=20'));
    
    print('Response status code: ${response.statusCode}');
    print('Response: ${response.body}');
    if(response.statusCode == 200){
      PeoplePage page = PeoplePage.fromJson(jsonDecode(response.body));
      print('total: ${page.total}');
      try {
        List<PersonRepo> people = page.data;
      } catch (e) {
        return null;
      }
      return page.data;
    }
  }
  Future<Map<String,dynamic>> getPeople2()async{
    var response = await _client.get(_getCompleteURL('users?per_page=20'), headers: await _getHeaders()).timeout(Duration(seconds: DURATION));
    
    // String json = '''
    //   {
    //     "name": "${user.lastName}",
    //   }
    // ''';

    // response = await _client.post(
    //     _getCompleteURL('users?per_page=20'),
    //     headers: await _getHeaders(),
    //     // body: jsonEncode(user.toJson())
    //   ).timeout(Duration(seconds: DURATION));
    
    print('Response status code: ${response.statusCode}');
    print('Response: ${response.body}');
    print('JsonDecode: ${jsonDecode(response.body)}');
    print('From json: ${PeoplePage.fromJson(jsonDecode(response.body)).data.toString()}');
    PeoplePage page = PeoplePage.fromJson(jsonDecode(response.body));
    return {'status': response.statusCode,'body':page.data};
    // if(response.statusCode == 200){
    //   print('total: ${page.total}');
    // }
  }

  

}