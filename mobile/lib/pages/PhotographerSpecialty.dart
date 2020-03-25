import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mobile/model/Specialty.dart';

class PhotographerSpecialty extends StatefulWidget {
  PhotographerSpecialty({Key key}) : super(key: key);

  @override
  _PhotographerSpecialtyState createState() => _PhotographerSpecialtyState();
}

class _PhotographerSpecialtyState extends State<PhotographerSpecialty> {
  Map<String, bool> values = {
    'Casamento': false,
    'Formatura': false,
    'Infantil': false,
    'Debutante': false,
  };

  List<Specialty> selectedChecks = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Especialidades'),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Column(
                    children: values.keys.map((String key) {
                      return new CheckboxListTile(
                        title: new Text(key),
                        value: values[key],
                        onChanged: (bool value) {
                          setState(() {
                            values[key] = value;
                            selectedChecks.clear();
                            values.forEach((key, value) {
                              if (value) {
                                print('${key}: ${value}');
                                selectedChecks.add(Specialty(key, value));
                              }
                            });
                          });
                        },
                      );
                    }).toList(),
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  print(values.toString());
                },
                child: Text('Salvar'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
