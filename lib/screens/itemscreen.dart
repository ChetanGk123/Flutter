import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_delivery/screens/cart.dart';
import 'package:food_delivery/screens/foodpage.dart';
import 'package:food_delivery/screens/homepage.dart';

class ItemScreen extends StatefulWidget {
  int index;
  ItemScreen(
    this.index,
  );

  @override
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final Color red = Color.fromRGBO(255, 75, 58, 1);
    return Scaffold(
        backgroundColor: Color.fromRGBO(245, 245, 245, 1),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  IconButton(
                      icon: Icon(Icons.arrow_back_ios_rounded),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
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
              SizedBox(
                height: size.height * 0.08,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Hero(
                        tag: allfood[widget.index].name,
                        child: Image.asset(
                          allfood[widget.index].image,
                          height: 200,
                          width: 200,
                        )),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    Center(
                      child: Text(
                        allfood[widget.index].name,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
                          child: Text(
                            allfood[widget.index].rate.toString(),
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: red),
                          ),
                        ),
                        cartValue(widget.index, context),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      children: [
                        Text(
                          "Delivery Info",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Delivery usually takes 20 minutes after ordering. \nSo stay calm and enjoy the your time,\nwhile our delivery agent will deliver your order",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black38),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.002,
                    ),
                    Row(
                      children: [
                        Text(
                          "Return Policy",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Delivery usually takes 20 minutes after ordering. \nSo stay calm and enjoy the your time,\nwhile our delivery agent will deliver your order",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black38),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    InkWell(
                      child: Container(
                        height: 60,
                        width: 310,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: red),
                        child: Center(
                          child: Text('Go to cart',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontSize: 20)),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CartBuild()));
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Container cartValue(int index, BuildContext context) {
    final Color red = Color.fromRGBO(255, 75, 58, 1);
    if ((allfood[index].quantity > 0)) {
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
                  allfood[index].quantity -= 1;
                  cart[index].quantity = allfood[index].quantity;
                  if (cart[index].quantity <= 0) {
                    cart.remove(cart[index]);
                  }
                  ;
                });
              },
            ),
            Text(
              allfood[index].quantity.toString(),
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
                  allfood[index].quantity += 1;
                  cart[index].quantity = allfood[index].quantity;
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
                allfood[index].quantity += 1;
                cart.add(allfood[index]);
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

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
