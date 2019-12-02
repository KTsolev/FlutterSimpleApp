import 'package:flutter/material.dart';
import 'User.dart';

class UserTile extends StatelessWidget {
  final User _user;
  UserTile(this._user);

  @override
  Widget build(BuildContext context) => Column(
    children: <Widget>[
      ListTile(
        title: Text(_user.firstName +" "+ _user.lastName),
        subtitle: Text(_user.email),
        leading: Container(
          margin: EdgeInsets.only(left: 6.0),
          child: Image.network(_user.avatar, height: 50.0, fit: BoxFit.fill)
        ),
      ),
      Divider()
    ],
  );
}