import 'package:flutter/material.dart';

class page3 extends StatelessWidget {
  const page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Align(alignment: Alignment.center, child: Image.asset("assets/images/img_1.png"))
    );
  }
}