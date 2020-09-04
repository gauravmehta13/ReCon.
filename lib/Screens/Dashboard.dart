import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Drawer.dart';

// ignore: must_be_immutable
class Dashboard extends StatefulWidget {
  var ipaddr;
  Dashboard({this.ipaddr});
  @override
  _DashboardState createState() => _DashboardState(ipaddr);
}

class _DashboardState extends State<Dashboard> {
  var ipaddr;
  _DashboardState(this.ipaddr);
  var op = " ";
  var msgLine = " ";
  String commandName = " ";
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('RemoteManagementApp'),
        centerTitle: true,
      ),
      drawer: DrawerList(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 5,
            ),
            Text(
              'Execute commands on server',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Enter the command",
                  border: OutlineInputBorder(),
                ),
                onChanged: (x) {
                  commandName = x;
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: Text('Execute'),
              onPressed: () async {
                var url =
                    "http://http://100.26.11.6//cgi-bin/rmm.py?x=$commandName";
                var result = await http.get(url);
                var data = result.body;
                setState(() {
                  msgLine = "Output of the $commandName comamnd is: ";
                  op = data;
                });
                print(data);
              },
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Text(
                    '$msgLine',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${op ?? "output will show up here"}',
                    style: TextStyle(
                      //decoration: BoxDecoration().borderRadius,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
