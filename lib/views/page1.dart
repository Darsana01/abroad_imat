import 'package:flutter/material.dart';

class page1 extends StatelessWidget {
  const page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Align(alignment: Alignment.center, child: Image.asset("assets/images/img3.jpeg"))
    );
  }
}