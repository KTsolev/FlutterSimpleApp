import 'package:flutter/material.dart';
import 'User.dart';
import 'apiCall.dart';
import 'main.dart';

class UserProfile extends StatefulWidget {  
  @override
  _UserProfile createState() => _UserProfile();
}

class _UserProfile extends State<UserProfile> {
  User _user;
  ScreenArguments _args;
  
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    setState(() => _args = args);
    
    if(_args !=null && _user == null) {
      listenForUser(_args.id);
    }


    return Scaffold (
      appBar: AppBar (
        centerTitle: true,
        title: Text(args.title),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
            Container(
              child: FadeInImage.assetNetwork(
                placeholder: 'images/prifle-dummy.png',
                image: _user.avatar,
              ),
            ),
            Container(
              child: Text(
                "${_user.firstName} ${_user.lastName}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 25)
                )),
            Container(
              child: Text(
                "${_user.email}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blue[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 22)
              )
            ),
        ])
      );
  }
  
  void listenForUser(id) async {
    if(id >= 0 ) {
      final User user = await fetchUser(id);
      setState(() => _user = user);
    }
  }
}