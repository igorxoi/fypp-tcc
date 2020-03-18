import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mobile/pages/UserRegisterImage.dart';
import 'package:mobile/services/ViaCepService.dart';
import 'package:mobile/widgets/TextField.dart';

class UserRegister extends StatefulWidget {
  @override
  _UserRegisterState createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  @override
  Widget build(BuildContext context) {
    final _nameController = TextEditingController();
    final _phoneController = TextEditingController();
    final _cepController = TextEditingController();
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();

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
    return Scaffold(
        resizeToAvoidBottomPadding: false,
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
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                width: width,
                margin: const EdgeInsets.all(0.0),
                child: Column(
                  children: <Widget>[
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
            ),
          ),
        ));
  }
}

// child: SingleChildScrollView(
//   child: Container(
//     color: Colors.red,
//     child: Column(
//       children: <Widget>[
//         Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: Colors.white,
//           ),
//           width: width,
//           margin: const EdgeInsets.all(0.0),
//           child: Column(
//             children: <Widget>[

//             ],
//           ),
//         ),
//       ],
//     ),
//   ),
// ),
