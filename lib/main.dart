import 'package:RMM/Screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Screens/Ask Ip.dart';
import 'Screens/Dashboard.dart';
import 'Screens/Disclaimer.dart';
import 'Screens/Docker_help.dart';
import 'Screens/Splash Screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
        title: 'Remote Management App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: SplashScreen(),
        routes: <String, WidgetBuilder>{
          '/signup': (BuildContext context) => new SignupPage(),
          '/AskIp': (BuildContext context) => new IpAddress(),
          '/Disclaimer': (BuildContext context) => new Disclaimer(),
          '/Dashboard': (BuildContext context) => new Dashboard(),
          '/docker_help': (BuildContext context) => new Docker_help(),
          '/IpAddress': (BuildContext context) => new IpAddress(),
        });
  }
}
