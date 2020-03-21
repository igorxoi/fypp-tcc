import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:mobile/pages/UserRegister.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:mobile/pages/UserRegisterImage.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/TextField.dart';

class UserLogin extends StatefulWidget {
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  FacebookLogin fbLogin = new FacebookLogin();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Login usuário'),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.deepPurpleAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              width: width,
              height: (height - 100),
              margin: const EdgeInsets.all(0.0),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(28.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Login',
                          style: TextStyle(fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MyTextField(
                            obscureText: false,
                            labelText: 'Usuário',
                            prefixIcon: Icon(Icons.person_outline),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MyTextField(
                            obscureText: true,
                            labelText: 'Senha',
                            prefixIcon: Icon(Icons.lock_outline),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MaterialButton(
                            onPressed: () {}, //since this is only a UI app
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            color: Colors.deepPurple,
                            elevation: 0,
                            minWidth: width,
                            height: 50,
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        Row(children: <Widget>[
                          Expanded(child: Divider()),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Text('ou'),
                          ),
                          Expanded(child: Divider()),
                        ]),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SignInButton(
                            Buttons.Twitter,
                            text: "Conectar com o Twitter",
                            onPressed: () {},
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SignInButton(
                            Buttons.Facebook,
                            text: "Conectar com o Facebook",
                            onPressed: () {
                              fbLogin.logInWithReadPermissions(['email']).then(
                                  (result) {
                                switch (result.status) {
                                  case FacebookLoginStatus.loggedIn:
                                  AuthCredential credential = FacebookAuthProvider.getCredential(accessToken: result.accessToken.token);
                                    FirebaseAuth.instance
                                        .signInWithCredential(
                                            credential)
                                        .then((signedInUser) {
                                      print(
                                          'Logado como ${signedInUser.user.displayName}');
                                      Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                            builder: (context) =>
                                                UserRegisterImage(name: signedInUser.user.displayName,),
                                          ));
                                    }).catchError((e) {
                                      print(e);
                                    });
                                    break;
                                  case FacebookLoginStatus.cancelledByUser:
                                    // TODO: Handle this case.
                                    break;
                                  case FacebookLoginStatus.error:
                                    // TODO: Handle this case.
                                    break;
                                }
                              }).catchError((e) {
                                print(e);
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Ainda não tem uma conta? ',
                                  style: TextStyle(fontSize: 14)),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                UserRegister()));
                                  },
                                  child: Text(
                                    'Cadastre-se',
                                    style: TextStyle(
                                        color: Colors.deepPurple, fontSize: 14),
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
