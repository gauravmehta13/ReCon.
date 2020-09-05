import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 0), () {});
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();

  Future<User> _signIn() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    final UserCredential authResult =
        await _auth.signInWithCredential(credential);
    final User user = authResult.user;

    print('User Name : ${user.displayName}');
    return user;
  }

  void _signOut() {
    googleSignIn.signOut();
    print('User Signed Out');
  }

  var email;
  var password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(color: Color(0xFFf2f0f2)),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/recon.gif'), fit: BoxFit.cover)),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            padding: EdgeInsets.only(top: 35.0, left: 25.0, right: 25.0),
            alignment: Alignment.centerLeft,
            child: Text(
              'Login',
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 30, left: 25.0, right: 25.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    onChanged: (x) {
                      setState(() {
                        email = x;
                      });
                    },
                    decoration: InputDecoration(
                        labelText: 'EMAIL',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    onChanged: (y) {
                      setState(() {
                        password = y;
                      });
                    },
                    decoration: InputDecoration(
                        labelText: 'PASSWORD',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black))),
                    obscureText: true,
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    alignment: Alignment(1.0, 0.0),
                    padding: EdgeInsets.only(top: 15.0, left: 20.0),
                    child: InkWell(
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.0),
                  GestureDetector(
                    onTap: () {
                      try {
                        _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                      } catch (e) {
                        print(e);
                      }

                      print(email);
                      print(password);
                      // Navigator.pushNamed(context, '/Disclaimer');
                    },
                    child: Container(
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.greenAccent,
                        color: Colors.green,
                        elevation: 7.0,
                        child: Center(
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  GestureDetector(
                    onTap: () {
                      _signIn()
                          .then((value) => (User user) => print(user))
                          .catchError((e) => print(e));
                    },
                    child: Container(
                      height: 40.0,
                      color: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black,
                                style: BorderStyle.solid,
                                width: 1.0),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(width: 20.0),
                            Center(
                              child: ImageIcon(AssetImage('assets/google.png')),
                            ),
                            SizedBox(width: 10.0),
                            Center(
                              child: Text('Login With Google',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat')),
                            ),
                            SizedBox(width: 20.0),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )),
          SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'New to Recon ?',
                style: TextStyle(fontFamily: 'Montserrat'),
              ),
              SizedBox(width: 5.0),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/signup');
                },
                child: Text(
                  'Register',
                  style: TextStyle(
                      color: Colors.green,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
