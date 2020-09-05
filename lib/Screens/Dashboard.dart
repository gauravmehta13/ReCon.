import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          'ReCon.',
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      drawer: DrawerList(),
      body: Stack(
        children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset("assets/dashboard.svg")),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 100,
                ),
                Text(
                  'Execute commands on server',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 40),
                      hintText: "Enter the command",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    onChanged: (x) {
                      commandName = x;
                    },
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () async {
                    var url = "http://54.160.88.233/cgi-bin/rmm.py?x=date";
                    var result = await http.get(url);
                    var data = result.body;
                    setState(() {
                      msgLine = "Output of the $commandName comamnd is: ";
                      op = data;
                    });
                    print(data);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: 40.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.greenAccent,
                      color: Colors.green,
                      elevation: 7.0,
                      child: Center(
                        child: Text(
                          'Execute',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                    ),
                  ),
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
        ],
      ),
    );
  }
}
