import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobile/mixins/Validations.dart';
import 'package:mobile/pages/UserRegisterImage.dart';
import 'package:mobile/services/ViaCepService.dart';
import 'package:mobile/widgets/TextField.dart';

class UserRegister extends StatefulWidget {
  @override
  _UserRegisterState createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  String content = "";
  String name = "";
  String phone = "";
  String cep = "";
  String email = "";
  String password = "";

  TextEditingController _nameController;
  TextEditingController _phoneController;
  TextEditingController _cepController;
  TextEditingController _emailController;
  TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    String name;
    String phone;
    String cep;
    String email;
    String password;

    insertUser(String user) async {
      final api = 'http://10.107.144.25:8080/photo/cliente';
      Map<String, String> headers = {'Content-type': 'application/json'};

      Response response = await post(api, headers: headers, body: user);
      if (response.statusCode == 201) {
        Map<String, dynamic> body = jsonDecode(response.body);
        print(body['nome']);
      }

      return response;
    }

    registerButtonAction() async {
      name = _nameController.text.trim();
      phone = _phoneController.text.trim();
      cep = _cepController.text.trim();
      email = _emailController.text.trim();
      password = _passwordController.text.trim();

      String user = jsonEncode({
        'id': 0,
        'nome': '$name',
        'telefone': '$phone',
        'cep': '$cep',
        'email': '$email',
        'senha': '$password'
      });

      Response response = await insertUser(user);
      Map<String, dynamic> body = jsonDecode(response.body);
      final _name = body['nome'];
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UserRegisterImage(
            name: _name,
          ),
        ),
      );
    }

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        // resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Cadastro usuário'),
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
                      height: (height - 100),
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
                              child: Container(
                                padding: const EdgeInsets.all(12.0),
                                child: Form(
                                  key: formKey,
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: nameField()),
                                      Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: phoneField()),
                                      Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: cepField()),
                                      Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: emailField()),
                                      Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: passwordField()),
                                      Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: submitButton()),
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
        labelText: 'Nome',
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
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(),
        ),
        labelText: 'Celular',
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
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(),
        ),
        labelText: 'CEP',
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
