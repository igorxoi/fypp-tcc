import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/mixins/Validations.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PhotographerRegister extends StatefulWidget {
  @override
  _PhotographerRegister createState() => _PhotographerRegister();
}

class _PhotographerRegister extends State<PhotographerRegister>
    with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  String content = "";
  String name = "";
  String cpf = "";
  String phone = "";
  String cep = "";
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        // resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Cadastro fotógrafo'),
          backgroundColor: Colors.deepPurple,
          elevation: 0,
        ),
        body: Container(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.deepPurpleAccent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      width: width,
                      height: height,
                      margin: const EdgeInsets.all(0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding:
                                  const EdgeInsets.only(left: 28.0, top: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Cadastro',
                                    style: TextStyle(fontSize: 30),
                                  ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Container(
                                height: height,
                                padding: const EdgeInsets.all(12.0),
                                child: Form(
                                  key: formKey,
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: nameField(),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: cpfField(),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: phoneField(),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: cepField(),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: emailField(),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: passwordField(),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: submitButton(),
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
                ],
              ),
            ),
          ),
        ));
  }

  Widget nameField() {
    return TextFormField(
      validator: validateName,
      onSaved: (value) {
        setState(() {
          name = value;
        });
      },
      obscureText: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(),
        ),
        labelText: 'Nome completo',
        labelStyle: TextStyle(fontSize: 14),
        prefixIcon: Icon(Icons.person_outline),
      ),
    );
  }

  Widget cpfField() {
    return TextFormField(
      validator: validateCpf,
      inputFormatters: [new MaskTextInputFormatter(mask: '###.###.###-##')],
      onSaved: (value) {
        setState(() {
          cpf = value;
        });
      },
      obscureText: false,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(),
        ),
        labelText: 'CPF (Apenas números)',
        labelStyle: TextStyle(fontSize: 14),
        prefixIcon: Icon(Icons.person_outline),
      ),
    );
  }

  Widget phoneField() {
    return TextFormField(
      inputFormatters: [new MaskTextInputFormatter(mask: '## ##### ####')],
      validator: validatePhone,
      onSaved: (value) {
        setState(() {
          phone = value;
        });
      },
      obscureText: false,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(),
        ),
        labelText: 'Celular (Com DDD)',
        labelStyle: TextStyle(fontSize: 14),
        prefixIcon: Icon(Icons.phone_iphone),
      ),
    );
  }

  Widget cepField() {
    return TextFormField(
      validator: validateCep,
      inputFormatters: [new MaskTextInputFormatter(mask: '#####-###')],
      onSaved: (value) {
        setState(() {
          cep = value;
        });
      },
      obscureText: false,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(),
        ),
        labelText: 'CEP (Apenas números)',
        labelStyle: TextStyle(fontSize: 14),
        prefixIcon: Icon(Icons.location_city),
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
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(),
        ),
        labelText: 'Email',
        labelStyle: TextStyle(fontSize: 14),
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
        labelStyle: TextStyle(fontSize: 14),
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
            print('$name');
          });
        }
      },
      child: Text(
        'CADASTRAR',
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
