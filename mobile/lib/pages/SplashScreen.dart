import 'package:flutter/material.dart';
import 'package:mobile/pages/LoginAs.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatefulWidget {
  Splash({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _Splash createState() => _Splash();
}

class _Splash extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return _introScreen();
  }
}

Widget _introScreen() {
  return Stack(
    children: <Widget>[
      SplashScreen(
        seconds: 5,
        gradientBackground: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.deepPurple, Colors.deepPurpleAccent],
        ),
        navigateAfterSeconds: LoginAs(),
        loaderColor: Colors.transparent,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          ],
        ),
      ),
    ],
  );
}
