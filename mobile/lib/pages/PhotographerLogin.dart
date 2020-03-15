import 'package:flutter/material.dart';
import 'package:mobile/widgets/TextField.dart';

class PhotographerLogin extends StatelessWidget {
  Widget LoginPage() {
    return new Stack(
      children: <Widget>[
        Container(
          color: Colors.pink,
          child: Container(
            margin: EdgeInsets.only(top: 240),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.all(23),
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Container(
                        color: Color(0xfff5f5f5),
                        child: MyTextField(
                            labelText: 'Usuário',
                            prefixIcon: Icon(
                              Icons.person_outline,
                            ))),
                  ),
                  Container(
                      color: Color(0xfff5f5f5),
                      child: MyTextField(
                        labelText: 'Senha',
                        prefixIcon: Icon(Icons.lock_outline),
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: MaterialButton(
                      onPressed: () {}, //since this is only a UI app
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Color(0xffff2d55),
                      elevation: 0,
                      minWidth: 400,
                      height: 50,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Center(
                      child: Text(
                        'Não tem uma conta?',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: MaterialButton(
                      onPressed: () {}, //since this is only a UI app
                      child: Text(
                        'CADASTRE-SE',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Color(0xffffffff),
                      elevation: 0,
                      minWidth: 400,
                      height: 50,
                      textColor: Colors.pink,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              style: BorderStyle.solid, color: Colors.pink),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        elevation: 0,
      ),
      body: Container(
        child: LoginPage(),
      ),
    );
  }
}
