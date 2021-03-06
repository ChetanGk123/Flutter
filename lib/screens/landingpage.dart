import 'package:flutter/material.dart';
import 'login.dart';

final Color red = Color.fromRGBO(255, 75, 58, 1);

void main() => runApp(Landingpage());

class Landingpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(body: Landingpage()),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Positioned(
              top: size.height * 0.0,
              right: size.width * 0.05,
              child: Container(
                height: size.height * 0.26,
                width: size.width * 0.26,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Image.asset('images/Logo.png'),
              )),
          Positioned(
            top: size.height * 0.15,
            left: size.width * 0.05,
            child: Container(
              width: size.width,
              child: Text(
                'Food for everyone',
                style: (TextStyle(
                    fontSize: 55, color: Colors.white, letterSpacing: 3)),
                maxLines: 2,
              ),
            ),
          ),
          Positioned(
              bottom: size.height * 0.2,
              right: size.width * -0.2,
              child: Transform.rotate(
                angle: 50.1,
                child: Image.asset(
                  'images/avatar1.png',
                  height: size.height * 0.48,
                  width: size.height * 0.5,
                ),
              )),
          Positioned(
              bottom: size.height * 0.1,
              left: size.width * -0.2,
              child: Transform.rotate(
                angle: 50.2,
                child: Image.asset(
                  'images/avatar2.png',
                  height: size.height * 0.55,
                  width: size.width * 0.55,
                ),
              )),
          Positioned(
            bottom: size.height * 0.09,
            child: Container(
                height: size.height * 0.3,
                width: size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                      Color.fromRGBO(255, 75, 58, 2),
                      Color.fromRGBO(255, 75, 58, 1),
                      Color.fromRGBO(255, 75, 58, 0)
                    ]))),
          ),
          Positioned(
              bottom: size.height * 0.03,
              right: size.width * 0.05,
              left: size.width * 0.05,
              child: InkWell(
                child: Container(
                  height: 60,
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40)),
                  child: Center(
                    child: Text(
                      'Get Started',
                      style: TextStyle(color: red, fontSize: 16),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              ))
        ],
      ),
    );
  }
}
