import 'package:RMM/Startup/Splash%20Screen.dart';
import 'package:RMM/startup/Login%20Page.dart';
import 'package:RMM/startup/Signup%20Page.dart';
import 'package:RMM/startup/Splash%20Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'startup/Ask Ip.dart';
import 'Screens/Dashboard.dart';
import 'startup/Disclaimer.dart';
import 'Screens/Docker help.dart';

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
        initialRoute: '/splash',
        routes: <String, WidgetBuilder>{
          '/splash': (BuildContext context) => splash(),
          '/login': (BuildContext context) => new LoginPage(),
          '/signup': (BuildContext context) => new SignupPage(),
          '/AskIp': (BuildContext context) => new IpAddress(),
          '/Disclaimer': (BuildContext context) => new Disclaimer(),
          '/Dashboard': (BuildContext context) => new Dashboard(),
          '/docker_help': (BuildContext context) => new Docker_help(),
          '/IpAddress': (BuildContext context) => new IpAddress(),
        });
  }
}
