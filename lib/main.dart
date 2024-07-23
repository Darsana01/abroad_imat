import 'dart:io';

import 'package:abroad_imat/Database/univercity/insertDatabase.dart';
import 'package:abroad_imat/views/bottom_nav.dart';
import 'package:abroad_imat/views/contries.dart';
import 'package:abroad_imat/views/onboardind.dart';
import 'package:flutter/material.dart';

void main() async{
      HttpOverrides.global = new MyHttpOverrides();
    WidgetsFlutterBinding.ensureInitialized();
  await insertUnivercityData();
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

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

  