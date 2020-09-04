import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Screens/Dashboard.dart';
import 'Screens/Docker.dart';
import 'Screens/Help.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountEmail: new Text(
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
          ),
          decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: AssetImage('assets/recon.gif'), fit: BoxFit.contain)),
        ),
        ListTile(
            title: new Text("Basic Commands"),
            trailing: new Icon(Icons.code),
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => Dashboard()));
            }),
        new ListTile(
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
            }),
        new Divider(),
        new ListTile(
          title: new Text("Cancel"),
          trailing: new Icon(Icons.cancel),
          onTap: () => Navigator.pop(context),
        ),
      ],
    ));
  }
}
