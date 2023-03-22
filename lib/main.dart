import 'package:flutter/material.dart';
import 'package:resume_maker_app/screen/homescreen.dart';
import 'package:resume_maker_app/screen/resume_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => Homescreen(),
        'data':(context) => Resumescreen(),
      },
      // home: Resumescreen(),
    ),
  );
}
