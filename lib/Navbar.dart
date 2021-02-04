import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apptest1/Hal1.dart';
import 'package:flutter_apptest1/Hal2.dart';
import 'package:flutter_apptest1/Hal3.dart';
import 'package:flutter_apptest1/Hal4.dart';
import 'package:flutter_apptest1/Hal5.dart';

class Navbar extends StatefulWidget {
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int selectedpage = 0;

  final halaman =[Hal1(),Hal2(),Hal3(),Hal4(),Hal5()];

  final bgcolor = [Colors.black12, Colors.blue, Colors.greenAccent, Colors.orange, Colors.blueGrey];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: halaman[selectedpage],
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        buttonBackgroundColor: Colors.white,
        backgroundColor: bgcolor[selectedpage],
        color: Colors.white,
        animationCurve: Curves.linearToEaseOut,
      items: [
        Icon(
          Icons.account_circle_rounded,
          size: 30,
          color: Colors.black,
        ),
        Icon(
          Icons.add,
          size: 30,
          color: Colors.black,
        ),
        Icon(
          Icons.qr_code,
          size: 30,
          color: Colors.black,
        ),
        Icon(
          Icons.compare_arrows,
          size: 30,
          color: Colors.black,
        ),
        Icon(
          Icons.flight_land,
          size: 30,
          color: Colors.black,
        )
      ],
        onTap: (index) {
          setState(() {
            selectedpage = index;
          });
        },
      ),
    );
  }
}
