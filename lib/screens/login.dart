import 'package:flutter/material.dart';

import 'Homepage.dart';

final Color red = Color.fromRGBO(255, 75, 58, 1);

void main() => runApp(LoginPage());

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  TabController controller;
  TextEditingController user;
  TextEditingController password;
  TextEditingController rpassword;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: child,
        );
      },
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
          backgroundColor: Color.fromRGBO(245, 245, 245, 1),
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  width: size.width,
                  height: size.height * 0.4,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: size.height * 0.3,
                        width: size.width * 0.5,
                        child: Image.asset(
                          'images/Logo.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      TabBar(
                          indicatorPadding:
                              EdgeInsets.only(left: 10, right: 10),
                          indicatorColor: red,
                          labelColor: Colors.black,
                          indicatorSize: TabBarIndicatorSize.label,
                          controller: controller,
                          tabs: [
                            Tab(
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    //color: Colors.black54,
                                    borderRadius: BorderRadius.circular(20)),
                                width: size.width * 0.2,
                                height: 30,
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Tab(
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    //color: Colors.black54,
                                    borderRadius: BorderRadius.circular(20)),
                                width: size.width * 0.2,
                                height: 30,
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ]),
                    ],
                  )),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: TabBarView(controller: controller, children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Name',
                                helperText: 'abcd@gmail.com',
                                labelText: 'User Name',
                                labelStyle: TextStyle(
                                    fontSize: 20, color: Colors.black)),
                            style: TextStyle(fontSize: 22, color: Colors.black),
                            controller: user,
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          TextField(
                            obscureText: true,
                            cursorHeight: 20,
                            decoration: InputDecoration(
                                hintText: 'password',
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                    fontSize: 20, color: Colors.black54)),
                            style: TextStyle(fontSize: 25, color: Colors.black),
                            controller: password,
                          ),
                          SizedBox(
                            height: size.height * 0.1,
                          ),
                          InkWell(
                            child: Container(
                              alignment: Alignment.center,
                              height: 55,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: red),
                              child: Text(
                                'Log In',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                            },
                          )
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Name',
                                helperText: 'abcd@gmail.com',
                                labelText: 'User Name',
                                labelStyle: TextStyle(
                                    fontSize: 20, color: Colors.black54)),
                            controller: user,
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          TextField(
                            obscureText: true,
                            cursorHeight: 20,
                            decoration: InputDecoration(
                                hintText: 'password',
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black54,
                                )),
                            controller: password,
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          TextField(
                            obscureText: true,
                            cursorHeight: 20,
                            decoration: InputDecoration(
                                hintText: 'password',
                                labelText: 'Re-enter Password',
                                labelStyle: TextStyle(
                                    fontSize: 20, color: Colors.black54)),
                            controller: password,
                          ),
                          SizedBox(
                            height: size.height * 0.1,
                          ),
                          InkWell(
                            child: Container(
                              alignment: Alignment.center,
                              height: 55,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: red),
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                            },
                          )
                        ],
                      ),
                    ),
                  ]),
                ),
              )
            ],
          )),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
