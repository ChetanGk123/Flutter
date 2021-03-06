import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:food_delivery/screens/cart.dart';
import 'package:food_delivery/screens/foodpage.dart';
import 'package:food_delivery/screens/itemscreen.dart';
import 'package:food_delivery/screens/landingpage.dart';

void main() {
  runApp(HomePage());
}

final Color bkcolor = Color.fromRGBO(242, 242, 242, 1);

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

int _index = 0;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color.fromRGBO(250, 250, 250, 10),
        body: Container(
            margin: EdgeInsets.only(right: 10, top: 30, left: 10, bottom: 20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      IconButton(icon: Icon(Icons.menu), onPressed: () {}),
                      Spacer(),
                      IconButton(
                          icon: Icon(Icons.shopping_cart_outlined),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CartBuild()));
                          }),
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 28.0),
                      child: Container(
                        width: size.width * 0.6,
                        child: Text(
                          'Delecious food for you',
                          style: (TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold)),
                        ),
                      )),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(210, 210, 210, 100),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextField(
                      style: TextStyle(fontSize: 20),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Search',
                          border: InputBorder.none),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: TabBar(
                        indicatorPadding: EdgeInsets.only(right: 20, left: 20),
                        unselectedLabelColor:
                            Color.fromRGBO(154, 154, 157, 100),
                        labelColor: Color.fromRGBO(250, 74, 12, 100),
                        indicatorColor: Color.fromRGBO(250, 74, 12, 100),
                        indicatorWeight: 3,
                        controller: controller,
                        isScrollable: true,
                        tabs: <Widget>[
                          Tab(
                            child: Text('  Foods  '),
                          ),
                          Tab(
                            child: Text('  Snacks  '),
                          ),
                          Tab(
                            child: Text('  Drinks  '),
                          ),
                          Tab(
                            child: Text('Sauce'),
                          ),
                        ]),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      child: TabBarView(
                        controller: controller,
                        children: [
                          Container(
                            child: tabBuilder(),
                          ),
                          Container(
                            color: Colors.green,
                            child: Text('text'),
                          ),
                          Container(
                            color: Colors.yellow,
                            child: Text('text'),
                          ),
                          Container(
                            color: Colors.orange,
                            child: Text('text'),
                          ),
                        ],
                      ),
                    ),
                  ))
                ])),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white38,
          currentIndex: _index,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedIconTheme: IconThemeData(size: 35, color: red),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border_outlined), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: ''),
            BottomNavigationBarItem(
                icon: IconButton(
                  icon: Icon(Icons.history),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CartBuild()));
                  },
                ),
                label: ''),
          ],
          unselectedItemColor: Colors.black45,
          onTap: (newindex) {
            setState(() {
              _index = newindex;
            });
          },
        ));
  }

  Widget tabBuilder() {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: Padding(
        padding: const EdgeInsets.only(top: 28.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            for (int i = 0; i < allfood.length; i++)
              InkWell(
                child: CardBuilder(i),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ItemScreen(i)));
                },
              )
          ]),
        ),
      ),
    );
  }
}

class CardBuilder extends StatelessWidget {
  final int index;

  const CardBuilder(
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
          height: 190,
          width: 150,
          child: Stack(
            overflow: Overflow.visible,
            children: [
              Positioned(
                  top: -50,
                  left: 16,
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Hero(
                      tag: allfood[index].name,
                      child: Image.asset(
                        allfood[index].image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
              Positioned(
                  bottom: 60,
                  left: 28,
                  child: Text(
                    allfood[index].name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
              Positioned(
                  bottom: 27,
                  left: 38,
                  child: Text(
                    allfood[index].rate.toString(),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(255, 75, 58, 1)),
                  )),
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
