
import 'package:cencus/Transactions.dart';
import 'package:cencus/census_add.dart';
import 'package:cencus/home.dart';
import 'package:cencus/play.dart';
import 'package:cencus/profile.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';


class Census_count extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.blueAccent,
        items: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
            child: Icon(Icons.home, size: 30),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Play()),
              );
            },
            child: Icon(Icons.play_circle, size: 30),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>Census_count()),
              );
            },
            child: Icon(Icons.add, size: 30),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Transactions()),
              );
            },
            child: Icon(Icons.money, size: 30),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
            },
            child: Icon(Icons.person, size: 30),
          ),
        ],
        onTap: (index) {
          // Handle button tap (if needed)
        },
      ),
    );
  }
}
