import 'package:flutter/material.dart';
import 'ListView.dart';
import 'UserProfile.dart';

void main() => runApp(MyApp());

class ScreenArguments {
  final String title;
  final int id;
  
  ScreenArguments(this.title, this.id);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterApp Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => MyHomePage(title: 'Flutter Home Page'),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/listView': (context) => UserList(),
        '/listView/profile:id': (context) => UserProfile(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Widget titleSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  'Oeschinen Lake Campground',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[500],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [ 
            Icon(
              Icons.star,
              color: Colors.red[500],
            ),
            Text('413'),
            ])
      ],
  );
  
  Widget buttons = Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        children: [
         Icon(
          Icons.phone,
          color: Colors.blue[300],
        ),
        Text('CALL'),
      ]),
      Column(
        children: [
        Icon(
          Icons.navigation,
          color: Colors.blue[300],
        ),
        Text('ROUTE'),
      ]),
      Column(
        children: [
        Icon(
          Icons.share,
          color: Colors.blue[300],
        ),
        Text('SHARE'),
      ])
    ]
  );
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(
           padding: const EdgeInsets.only(bottom: 20),
           child: Image.asset(
              'images/lake1.jpg',            
              width: 750,
              height: 220,
              fit: BoxFit.cover,            
            ),  
          ),
          Container(
            child: titleSection,
            margin: const EdgeInsets.only(bottom: 10),

          ),
          Container(
            child: buttons,
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.only(left: 72, right: 72),
          ),
          Container(
            padding: const EdgeInsets.all(32),
            child: Text(
                  'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
                  'Alps. Situated 1,578 meters above sea level, it is one of the '
                  'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
                  'half-hour walk through pastures and pine forest, leads you to the '
                  'lake, which warms to 20 degrees Celsius in the summer. Activities '
                  'enjoyed here include rowing, and riding the summer toboggan run.',
              softWrap: true,
            ),
          ),
          Center(
            child: RaisedButton(
              child: Text('Open route'),
              onPressed: () {
                // Navigate to second route when tapped.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserList(),
                       settings: RouteSettings(
                       arguments: ScreenArguments(
                          'User List View',
                          -20
                       ),
                     ),
                  )
                );
              },
            ),
          ),
        ]
      ),
    );
  }
}
