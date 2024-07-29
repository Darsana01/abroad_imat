import 'package:flutter/material.dart';

class page2 extends StatelessWidget {
  const page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Align(alignment: Alignment.center, child: Image.asset("Assets/Images/img1.jpeg"))
    );
  }
}