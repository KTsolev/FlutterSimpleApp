import 'package:flutter/material.dart';
import 'User.dart';
import 'UserProfile.dart';
import 'main.dart';

class UserTile extends StatelessWidget {
  final User _user;
  UserTile(this._user);

  @override
  Widget build(BuildContext context) => new GestureDetector(
    child: Column(
      children: <Widget>[
        ListTile(
          title: Text("${_user.firstName} ${_user.lastName}"),
          subtitle: Text(_user.email),
          leading: Container(
            margin: EdgeInsets.only(left: 6.0),
            child: FadeInImage.assetNetwork(
              placeholder: 'images/prifle-dummy.png',
              image: _user.avatar,
             ),
          ),
        ),
        Divider()
      ],
    ),
  onTap:(){
    print(_user.id);
      Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserProfile(),
                      settings: RouteSettings(
                      arguments: ScreenArguments(
                        'User Profile View',
                        _user.id
                      ),
                    ),
                  )
                );
    }
  );
}