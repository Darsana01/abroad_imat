import 'package:abroad_imat/views/bottom_nav.dart';
import 'package:abroad_imat/views/contries.dart';
import 'package:abroad_imat/views/onboardind.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      home:  bottom_nav(),
    );
  }
}



  