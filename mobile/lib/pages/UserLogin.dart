import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:mobile/mixins/Validations.dart';
import 'package:mobile/pages/UserRegister.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:mobile/pages/UserRegisterImage.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/TextField.dart';

class UserLogin extends StatefulWidget {
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> with ValidationMixin {
  final formKey = GlobalKey<FormState>();

  String content = "";

  String email = "";

  String password = "";

  FacebookLogin fbLogin = new FacebookLogin();

  facebookAuth() {
    fbLogin.logInWithReadPermissions(['email']).then((result) {
      switch (result.status) {
        case FacebookLoginStatus.loggedIn:
          AuthCredential credential = FacebookAuthProvider.getCredential(
              accessToken: result.accessToken.token);
          FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((signedInUser) {
            print(
                'Logado como ${signedInUser.user.displayName}, ${result.accessToken.token}');
            Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => UserRegisterImage(
                    name: signedInUser.user.displayName,
                    token: result.accessToken.token,
                  ),
                ));
          }).catchError((e) {
            print(e);
          });
          break;
        case FacebookLoginStatus.cancelledByUser:
          break;
        case FacebookLoginStatus.error:
          break;
      }
    }).catchError((e) {
      print(e);
    });
  }

  changeThePage(BuildContext context) {
    Navigator.of(context)
        .push(CupertinoPageRoute(builder: (context) => UserRegisterImage()));
  }

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
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: emailField()),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: passwordField()),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: submitButton()),
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
                                facebookAuth();
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
                                          color: Colors.deepPurple,
                                          fontSize: 14),
                                    ))
                              ],
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
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      validator: validateEmail,
      onSaved: (value) {
        setState(() {
          email = value;
        });
      },
      obscureText: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(),
        ),
        labelText: 'Email',
        prefixIcon: Icon(Icons.email),
      ),
    );
  }

  Widget passwordField() {
    return TextFormField(
      validator: validatePassword,
      onSaved: (value) {
        setState(() {
          password = value;
        });
      },
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(),
        ),
        labelText: 'Senha',
        prefixIcon: Icon(Icons.lock_outline),
      ),
    );
  }

  Widget submitButton() {
    return MaterialButton(
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          setState(() {
            print('$email');
          });
        }
      },
      child: Text(
        'LOGIN',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      color: Colors.deepPurple,
      elevation: 0,
      minWidth: 400,
      height: 50,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
  }
}
