import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mobile/pages/UserRegisterImage.dart';
import 'package:mobile/services/ViaCepService.dart';
import 'package:mobile/widgets/TextField.dart';

class PhotographerRegister extends StatefulWidget {
  @override
  _PhotographerRegister createState() => _PhotographerRegister();
}

class _PhotographerRegister extends State<PhotographerRegister> {
  @override
  Widget build(BuildContext context) {
    final _nameController = TextEditingController();
    final _cpfController = TextEditingController();
    final _phoneController = TextEditingController();
    final _cepController = TextEditingController();
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();

    String name;
    String cpf;
    String phone;
    String cep;
    String email;
    String password;

    insertUser(String user) async {
      final api = 'http://10.107.144.25:8080/photo/fotografo';
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
      cpf = _cpfController.text.trim();
      phone = _phoneController.text.trim();
      cep = _cepController.text.trim();
      email = _emailController.text.trim();
      password = _passwordController.text.trim();

      String user = jsonEncode({
        'id': 0,
        'nome': '$name',
        'cpf': '$cpf',
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
                  )));

      // jsonDecode(user);

      // if (user != '') {
      //   print(user);
      //   Navigator.push(context,
      //       MaterialPageRoute(builder: (context) => UserRegisterImage()));
      // }
    }

    // Future searchCep() async {
    //   cep = _cepController.text.trim();
    //   final resultCep = await ViaCepService.fetchCep(cep: cep);
    //   print(resultCep.localidade);
    // }

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
                  Container(
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
                          padding: const EdgeInsets.only(left: 28.0, top: 20.0),
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
                        Container(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: MyTextField(
                                  obscureText: false,
                                  controller: _nameController,
                                  labelText: 'Nome',
                                  prefixIcon: Icon(Icons.person_outline),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: MyTextField(
                                  obscureText: false,
                                  controller: _nameController,
                                  labelText: 'CPF',
                                  prefixIcon: Icon(Icons.assignment),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: MyTextField(
                                  obscureText: false,
                                  controller: _phoneController,
                                  labelText: 'Telefone',
                                  prefixIcon: Icon(Icons.phone_iphone),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: MyTextField(
                                  obscureText: false,
                                  controller: _cepController,
                                  labelText: 'CEP',
                                  prefixIcon: Icon(Icons.location_city),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: MyTextField(
                                  obscureText: false,
                                  controller: _emailController,
                                  labelText: 'Email',
                                  prefixIcon: Icon(Icons.mail_outline),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: MyTextField(
                                  obscureText: true,
                                  controller: _passwordController,
                                  labelText: 'Senha',
                                  prefixIcon: Icon(Icons.lock_outline),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: MaterialButton(
                                  onPressed: () async {
                                    registerButtonAction();
                                  }, //since this is only a UI app
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
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
