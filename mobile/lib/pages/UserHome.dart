import 'package:flutter/material.dart';

class UserHome extends StatefulWidget {
  UserHome({Key key}) : super(key: key);

  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(

       ),
       body: Center(
         child: Column(
           children: <Widget>[
             Text('Home')
           ],
         ),
       ),
    );
  }
}