import 'package:flutter/material.dart';

import '../Screens/Dashboard.dart';

class IpAddress extends StatefulWidget {
  @override
  _IpAddressState createState() => _IpAddressState();
}

class _IpAddressState extends State<IpAddress> {
  var ipaddr = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(30),
          color: Colors.grey[400],
          height: MediaQuery.of(context).size.height,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    hintText: "Enter the Public IP of your VM",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (x) {
                    ipaddr = x;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  child: Text('Abi ip wala add ni kia h just click next'),
                  onPressed: () {
                    print(ipaddr);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Dashboard(
                                  ipaddr: ipaddr,
                                )));
                  },
                ),
              ])),
    );
  }
}
