import 'package:RMM/Startup/Login%20Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'Screens/Dashboard.dart';
import 'Screens/Docker.dart';
import 'Screens/Help.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: <Widget>[
        UserAccountsDrawerHeader(
          /* accountEmail: new Text(
            "Gaurav",
            style: TextStyle(color: Colors.black),
          ),
          accountName: new Text(
            "Welcome User",
            style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
          ),
          currentAccountPicture: new GestureDetector(
            child: new CircleAvatar(
              backgroundImage: new NetworkImage(
                  'https://www.pngkit.com/png/detail/281-2812821_user-account-management-logo-user-icon-png.png'),
            ),
            onTap: () => Fluttertoast.showToast(
                msg: "Your Profile",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.yellowAccent,
                textColor: Colors.black,
                fontSize: 16.0),
          ),*/
          decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: AssetImage('github logo.png'), fit: BoxFit.fitWidth)),
        ),
        ListTile(
            title: new Text("Execute Commands"),
            trailing: new Icon(Icons.code),
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => Dashboard()));
            }),
        /*new ListTile(
            title: new Text("Docker"),
            trailing: new Icon(Icons.cloud),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => Docker()));
            }),
        new ListTile(
            title: new Text("Get Help"),
            trailing: new Icon(Icons.help),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => Help()));
            }),*/
        new Divider(),
        Expanded(
            child: Align(
          alignment: Alignment.bottomCenter,
          child: ListTile(
            title: new Text("Get Help"),
            leading: new Icon(Icons.add_alert_rounded),
            onTap: () {},
          ),
        )),
      ],
    ));
  }
}
