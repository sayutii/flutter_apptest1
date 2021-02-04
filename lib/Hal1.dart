import 'dart:ui';

import 'package:flutter/material.dart';

class Hal1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: Text('Profil Saya'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 30.0,),
          Text('SORRY SALAH KETIK',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue)
            ,),
          SizedBox(height: 30.0,),
          CircleAvatar(backgroundImage: AssetImage("assets/sayuti.jpg"),radius: 50,),
          SizedBox(height: 20.0,),
          Text('Muhammad Sayuti',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)
            ,),
          Text('Banda Aceh, Aceh',
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey)
            ,),
          SizedBox(height: 150.0,),
          Text('"Nothing last forever we can change the future"',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)
            ,),
        ],),),
    );
  }
}
