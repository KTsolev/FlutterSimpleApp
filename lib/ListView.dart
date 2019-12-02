import 'package:flutter/material.dart';
import 'User.dart';
import 'UserTile.dart';
import 'apiCall.dart';

class UserList extends StatefulWidget {
  UserList({Key key, this.title}) : super(key: key);
  
  final String title;

  @override
  _UsersScreen createState() => _UsersScreen(title: this.title);
}

class _UsersScreen extends State<UserList> {
  _UsersScreen({this.title});
  
  final String title;

  List<User> _users = <User>[];
  
  @override
   void initState() {
    super.initState();
    listenForUsers();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(this.title),
      ),
       body: ListView.builder(
                itemCount: _users.length,
                itemBuilder: (context, index) => UserTile(_users[index]),
              ),
    );
  }

  void listenForUsers() async {
    final List<User> users = await fetchUsers();
    setState(() => _users = users);
  }
}
