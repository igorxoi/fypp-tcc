import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/mixins/Validations.dart';
import 'package:mobile/pages/PhotographerRegister.dart';
import 'package:mobile/pages/UserRegisterImage.dart';
import 'package:mobile/widgets/TextField.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class PhotographerLogin extends StatefulWidget {
  @override
  _PhotographerLoginState createState() => _PhotographerLoginState();
}

class _PhotographerLoginState extends State<PhotographerLogin>
    with ValidationMixin {
  final formKey = GlobalKey<FormState>();

  String content = "";

  String email = "";

  String password = "";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Login fotógrafo'),
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
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
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
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0),
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
                                onPressed: () {},
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
                                                    PhotographerRegister()));
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
