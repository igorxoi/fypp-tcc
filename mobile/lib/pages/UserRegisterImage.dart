import 'package:flutter/material.dart';

class UserRegisterImage extends StatefulWidget {
  final String name;

  UserRegisterImage({Key key, this.name}) : super(key: key);

  @override
  _UserRegisterImageState createState() => _UserRegisterImageState();
}

class _UserRegisterImageState extends State<UserRegisterImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Escolher imagem de perfil'),
        backgroundColor: Colors.purple,
        elevation: 0,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                'Bem vindo, ' + widget.name,
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
