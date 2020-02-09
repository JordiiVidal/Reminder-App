import 'package:flutter/material.dart';

//Colors
//const kPrimaryColor = Color(0xff5a415c);
const kPrimaryColor = Color(0xff171918);
const kTertiaryColor = Color(0xff6A526C);
const kSecondaryColor = Color(0xff89d7c8);
const kAccentColor = Color(0xff89d7c8);
const kLightColor = Color(0xffe3e4e8);

//TextStyle
const kTitle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w700,
  fontSize: 23.0,
);

//Form
const kInputDecoration = InputDecoration(
  helperText: 'Escribir el nombre de recordatorio.',
  helperStyle: TextStyle(fontSize: 10.0),
  errorStyle: TextStyle(fontSize: 9.0),
  fillColor: Color(0xfffbfafb),
  filled: true,
  hintText: 'Título',
  contentPadding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
);
const kTextAreaDecoration = InputDecoration(
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xff757575), width: 1.0),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xff757575), width: 1.0),
  ),
  helperStyle: TextStyle(fontSize: 10.0),
  errorStyle: TextStyle(fontSize: 9.0),
  contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
  helperText: 'Escribir una nota referente al recordatorio.',
  labelText: 'NOTAS',
  labelStyle: TextStyle(
    color: Color(0xff757575),
    fontSize: 15,
    fontWeight: FontWeight.w500,
  ),
);

//Calendar
