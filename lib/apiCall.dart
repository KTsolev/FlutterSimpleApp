    
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'User.dart';

Future<List<User>> fetchUsers() async {
  final String url = 'https://reqres.in/api/users?page=1&per_page=12';

   http.Response response = await http.get(url);
  
   if (response.statusCode != 200) return null;
  
   var users = List<Map<String, dynamic>>.from(json.decode(response.body)['data']);
  
  return users.map((item){
      return new User(item['email'], item['first_name'], item['last_name'], item['avatar'], item['id']);
    }).toList();
  }

Future<User> fetchUser(id) async {
  final String url = 'https://reqres.in/api/users/${id}';
   print(url);

   http.Response response = await http.get(url);
   print(response);

   if (response.statusCode != 200) return null;
  
   var user = Map<String, dynamic>.from(json.decode(response.body)['data']);
   print(user);

   return new User(user['email'], user['first_name'], user['last_name'], user['avatar'], user['id']);
  }