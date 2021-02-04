import 'dart:ui';

import 'package:flutter/material.dart';

class Hal4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: Text('Halaman 4'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Ini Halaman Sayuti 4',
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue)
              ,),
            SizedBox(height: 30.0,),
            Icon(
              Icons.drive_eta,
              size: 50,
              color: Colors.black87,
            )
          ],),),
    );
  }
}
