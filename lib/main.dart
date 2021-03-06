import 'package:flutter/material.dart';

import 'screens/homepage.dart';
import 'screens/landingpage.dart';

final Color red = Color.fromRGBO(255, 75, 58, 1);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: red,
        body: LandingPage(),
      ),
    );
  }
}
