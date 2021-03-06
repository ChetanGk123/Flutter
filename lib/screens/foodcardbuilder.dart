import 'package:flutter/material.dart';
import 'package:food_delivery/screens/foodpage.dart';

class CustomApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: ListViewBuilder(),
      ),
    );
  }
}

class ListViewBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: allfood.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 120,
                  width: 120,
                  color: Colors.amber,
                  child: Positioned(
                    top: -50,
                    child: Image.asset(
                      allfood[index].image,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Spacer(),
                Text(allfood[index].name),
                Spacer(
                  flex: 2,
                )
              ],
            ),
          );
        });
  }
}
