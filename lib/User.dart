import 'dart:convert';

class User {
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;
  final int id;

User(this.email, this.firstName, this.lastName, this.avatar, this.id);

 factory User.fromJSON(Map<String, dynamic> jsonMap) {
   if(jsonMap == null) {
     return null;
   }
   
   return new User (
    jsonMap['email'],
    jsonMap['firstName'],
    jsonMap['lastName'],
    jsonMap['avatar'],
    jsonMap['id'],
   );
 }
}