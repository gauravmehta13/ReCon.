import 'package:RMM/Screens/Terminal.dart';
import 'package:RMM/Startup/Splash Screen.dart';
import 'package:RMM/startup/Login Page.dart';
import 'package:RMM/startup/Signup Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'startup/Ask Ip.dart';
import 'Screens/Dashboard.dart';
import 'startup/Disclaimer.dart';
import 'Screens/Docker help.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
        title: 'ReCon.',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: Colors.white,
        ),
        initialRoute: '/Terminal',
        routes: <String, WidgetBuilder>{
          '/splash': (BuildContext context) => splash(),
          '/login': (BuildContext context) => new LoginPage(),
          '/Terminal': (BuildContext context) => new Terminal(),
          '/signup': (BuildContext context) => new SignupPage(),
          '/AskIp': (BuildContext context) => new IpAddress(),
          '/Disclaimer': (BuildContext context) => new Disclaimer(),
          '/Dashboard': (BuildContext context) => new Dashboard(),
          '/docker_help': (BuildContext context) => new Docker_help(),
          '/IpAddress': (BuildContext context) => new IpAddress(),
        });
  }
}
