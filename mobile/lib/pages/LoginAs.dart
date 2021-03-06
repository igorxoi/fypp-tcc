import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/animations/FadeAnimation.dart';
import 'package:mobile/pages/PhotographerLogin.dart';
import 'package:mobile/pages/UserLogin.dart';
import 'package:mobile/widgets/SlideRoute.dart';
import 'package:mobile/widgets/TopShape.dart';

import 'PhotographerLogin.dart';
import 'UserLogin.dart';

class LoginAs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            FadeAnimation(
              1,
              TopShape(
                height: 130.0,
              ),
            ),
            Container(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 28.0),
                      child: FadeAnimation(
                          1.5,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Bem vindo!',
                                style: TextStyle(fontSize: 30),
                              ),
                              Text('Escolha como você quer se autenticar')
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FadeAnimation(
                          1.9,
                          CupertinoButton(
                            child: Container(
                              height: 200,
                              width: width,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/inkewell.jpg"),
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                      Colors.deepPurple.withOpacity(0.7),
                                      BlendMode.darken),
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Container(
                                margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
                                child: Text(
                                  "Sou um fotógrafo",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) =>
                                          PhotographerLogin()));
                            },
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                      child: FadeAnimation(
                        2.2,
                        Row(children: <Widget>[
                          Expanded(child: Divider()),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Text('ou'),
                          ),
                          Expanded(child: Divider()),
                        ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FadeAnimation(
                          2.6,
                          CupertinoButton(
                            child: Container(
                              height: 200,
                              width: width,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/inkwell-cliente.jpg"),
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                      Colors.deepPurple.withOpacity(0.5),
                                      BlendMode.darken),
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Container(
                                margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
                                child: Text(
                                  "Estou procurando um fotógrafo",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => UserLogin()));
                            },
                          )),
                    ),
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
