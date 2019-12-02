    
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'User.dart';

Future<List<User>> fetchUsers() async {
  final String url = 'https://reqres.in/api/users?page=1';

   http.Response response = await http.get(url);
  
   if (response.statusCode != 200) return null;
  
   var streamedRest = List<Map<String, dynamic>>.from(json.decode(response.body)['data']);
  
  return streamedRest.map((item){
    print(item);
    return new User(item['email'], item['first_name'], item['last_name'], item['avatar'], item['id']);
    }).toList();
  }
