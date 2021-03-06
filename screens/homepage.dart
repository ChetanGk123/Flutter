import 'package:flutter/material.dart';

Color red = Color(0xFF4B3A);

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return MaterialApp(
        title: 'Material App',
        home: Container(
          child: Text("hello"),
        ));
  }
}
