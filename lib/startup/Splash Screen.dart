import 'dart:async';
import 'package:flutter/material.dart';

class splash extends StatefulWidget {
  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(color: Color(0xFFf2f0f2)),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/recon.gif'), fit: BoxFit.cover)),
          ),
          SizedBox(
            height: 280,
          ),
          CircularProgressIndicator(
            backgroundColor: Colors.green,
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),
          ),
        ],
      ),
    ));
  }
}
