import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';

class UserRegisterImage extends StatefulWidget {
  final String name;
  final String token;

  UserRegisterImage({Key key, this.name, this.token}) : super(key: key);

  @override
  _UserRegisterImageState createState() => _UserRegisterImageState();
}

class _UserRegisterImageState extends State<UserRegisterImage> {
  File _image;

  final String endPoint = 'http://192.168.0.108:8080/photo/cliente/foto';

  @override
  Widget build(BuildContext context) {
    Future getImage() async {
      var image = await ImagePicker.pickImage(
          source: ImageSource.gallery, maxHeight: 450.0, maxWidth: 450.0);
      setState(() {
        _image = image;
        print('Path $_image');
      });
    }

    void uploadImage() {
      String base64 = base64Encode(_image.readAsBytesSync());
      String filename = _image.path.split("/").last;
      final mime = lookupMimeType(_image.path, headerBytes: [0xFF, 0xD8]).split('/');

      var body = jsonEncode(
          {"filename": filename, "mimetype": 'image/jpeg', "base64": base64});

      http.post(endPoint, headers: {
        "Accept": "application/json",
        "content-type": "application/json"
      }, body: body).then((res) {
        print(res.statusCode);
      }).catchError((e) {
        print(e);
      });
    }

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Escolher imagem de perfil'),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              width: width,
              height: 500,
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Olá,',
                      style: TextStyle(fontSize: 32, color: Colors.white),
                    ),
                    Text(
                      widget.name + '.',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                  radius: 80,
                                  child: ClipOval(
                                      child: SizedBox(
                                    width: 180.0,
                                    height: 180.0,
                                    child: (_image != null)
                                        ? Image.file(
                                            _image,
                                            fit: BoxFit.cover,
                                          )
                                        : Image.network(
                                            'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                                            fit: BoxFit.fill,
                                          ),
                                  ))),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton(
                                onPressed: () {
                                  getImage();
                                },
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Selecionar imagem de perfil',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.deepPurple,
                                        ),
                                      ),
                                      Icon(
                                        FontAwesomeIcons.camera,
                                        color: Colors.deepPurple,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton(
                                onPressed: () {
                                  uploadImage();
                                },
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Salvar',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.deepPurple,
                                        ),
                                      ),
                                      Icon(
                                        FontAwesomeIcons.image,
                                        color: Colors.deepPurple,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
