import 'package:flutter/material.dart';
import 'package:resume_maker_app/screen/dashscreen.dart';
import 'package:resume_maker_app/screen/homescreen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => Homescreen(),
        'dash':(context) => Dash(),
      },
    ),
  );
}
