import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final String labelText;
  final Icon prefixIcon;
  final TextEditingController controller;
  final bool obscureText;
  final String errorText;
  final int maxLenght;

  const MyTextField({Key key, this.labelText, this.prefixIcon, this.controller, this.obscureText, this.errorText, this.maxLenght})
      : super(key: key);

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.obscureText,
      maxLength: widget.maxLenght,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.pink)),
          labelText: widget.labelText,
          errorText: widget.errorText,
          prefixIcon: widget.prefixIcon,
          labelStyle: TextStyle(fontSize: 15)),
    );
  }
}
