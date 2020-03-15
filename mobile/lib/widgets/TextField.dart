import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String labelText;
  final Icon prefixIcon;

  const MyTextField({Key key, this.labelText, this.prefixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.pink)),
          labelText: labelText,
          prefixIcon: prefixIcon,
          labelStyle: TextStyle(fontSize: 15)),
    );
  }
}
