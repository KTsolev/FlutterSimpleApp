import 'package:flutter/material.dart';
import 'User.dart';
import 'UserTile.dart';
import 'apiCall.dart';
import 'main.dart';

class UserList extends StatefulWidget {
  @override
  _UsersScreen createState() => _UsersScreen();
}

class _UsersScreen extends State<UserList> {

  List<User> _users = <User>[];
  
  @override
   void initState() {
    super.initState();
    listenForUsers();
  }


  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    
    return Scaffold (
      appBar: AppBar (
        centerTitle: true,
        title: Text(args.title),
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
