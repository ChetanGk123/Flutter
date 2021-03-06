import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_delivery/screens/foodpage.dart';
import 'package:food_delivery/screens/itemscreen.dart';

class CartBuild extends StatefulWidget {
  CartBuild({Key key}) : super(key: key);

  @override
  _CartBuildState createState() => _CartBuildState();
}

class _CartBuildState extends State<CartBuild> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final Color red = Color.fromRGBO(255, 75, 58, 1);
    return Scaffold(
        backgroundColor: Color.fromRGBO(245, 245, 245, 1),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                      icon: Icon(Icons.arrow_back_ios_rounded),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  SizedBox(
                    width: size.width * 0.2,
                  ),
                  Text(
                    'Cart',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.4,
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.08,
              ),
              Text('swipe left or right to delete items'),
              Expanded(
                child: Scaffold(
                  backgroundColor: Color.fromRGBO(245, 245, 245, 1),
                  body: ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: cart.length,
                      padding: EdgeInsets.all(10),
                      itemBuilder: (BuildContext context, int index) {
                        return Dismissible(
                          resizeDuration: Duration(microseconds: 900),
                          confirmDismiss: (directon) async {
                            if (directon == DismissDirection.endToStart) {
                              final bool result = await showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return alertDialog(index, context);
                                  });
                            }
                          },
                          background: RightSwipe(),
                          key: Key(index.toString()),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(30),
                              child: Container(
                                padding: EdgeInsets.all(9),
                                height: size.height * 0.13,
                                width: size.width,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      child: Hero(
                                        tag: cart[index].name,
                                        child: Image.asset(
                                          '${cart[index].image}',
                                          height: 80,
                                          width: 80,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 5,
                                      left: size.width * 0.3,
                                      child: Text(
                                        cart[index].name,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Positioned(
                                      top: size.height * 0.07,
                                      left: size.width * 0.3,
                                      child: Container(
                                        child: Text(
                                          (cart[index].rate *
                                                  cart[index].quantity)
                                              .toString(),
                                          style: TextStyle(
                                              color: red,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        top: size.height * 0.06,
                                        right: size.width * 0.03,
                                        child: cartValue(index, context))
                                  ],
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ItemScreen(index)));
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                child: Container(
                  height: 60,
                  width: 310,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40), color: red),
                  child: Center(
                    child: Text('Complete Order',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 20)),
                  ),
                ),
                onTap: () {},
              )
            ],
          ),
        ));
  }

  AlertDialog alertDialog(int index, BuildContext context) {
    return AlertDialog(
      title: Text('Are you sure, you want to delete ${cart[index].name}'),
      actions: [
        FlatButton(
          child: Container(
            height: 40,
            width: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.red),
            child: Center(
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Container(
            height: 40,
            width: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.red),
            child: Center(
              child: Text(
                "Delete",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          onPressed: () {
            // TODO: Delete the item from DB etc..
            setState(() {
              cart.removeAt(index);
            });
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  Container cartValue(int index, BuildContext context) {
    final Color red = Color.fromRGBO(255, 75, 58, 1);
    if ((cart[index].quantity > 0)) {
      return Container(
        height: 30,
        width: 85,
        decoration:
            BoxDecoration(color: red, borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            InkWell(
              child: Icon(
                Icons.remove,
                color: Colors.white,
                size: 20,
              ),
              onTap: () {
                setState(() {
                  cart[index].quantity -= 1;
                  if (cart[index].quantity <= 0) {}
                });
              },
            ),
            Text(
              cart[index].quantity.toString(),
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            InkWell(
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 20,
              ),
              onTap: () {
                setState(() {
                  cart[index].quantity += 1;
                });
              },
            ),
          ],
        ),
      );
    } else {
      return Container(
          height: 30,
          width: 85,
          decoration: BoxDecoration(
              color: red, borderRadius: BorderRadius.circular(30)),
          child: InkWell(
            onTap: () {
              setState(() {
                cart[index].quantity += 1;
              });
            },
            child: Center(
                child: Text(
              'Add',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )),
          ));
    }
  }
}

Widget RightSwipe() {
  return Container(
    padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
            height: 50,
            width: 50,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.red),
            child: Icon(
              Icons.delete_outline,
              color: Colors.white,
            ))
      ],
    ),
  );
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
