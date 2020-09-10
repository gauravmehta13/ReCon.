import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'Docker.dart';
import 'Output.dart';
import 'Terminal.dart';

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
  var _controller = TextEditingController();
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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.assignment),
            onPressed: () => Navigator.of(context).push(
              new MaterialPageRoute(
                  builder: (BuildContext context) => Output(
                        op: op,
                        commandName: commandName,
                      )),
            ),
          )
        ],
      ),
      drawer: Drawer(
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
                    image: AssetImage('github logo.png'),
                    fit: BoxFit.fitWidth)),
          ),
          ListTile(
              title: new Text("Execute Commands"),
              leading: FaIcon(FontAwesomeIcons.terminal),
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => Dashboard()));
              }),
          new ListTile(
              title: new Text("Terminal"),
              leading: FaIcon(FontAwesomeIcons.terminal),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => Terminal(
                          ipaddr: ipaddr,
                        )));
              }),
          Divider(),
          new ListTile(
              title: new Text("Docker"),
              leading: FaIcon(FontAwesomeIcons.docker),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Docker(
                              ipaddr: ipaddr,
                            )));
              }),
          new Divider(),
          Expanded(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: ListTile(
                title: new Text("Setup"),
                leading: FaIcon(FontAwesomeIcons.handsHelping),
                onTap: () {
                  launch(
                      'https://thesocialcomment.com/blog/Executing-Commands-on-Cloud-VM-s-Remotely-using-Recon-?pid=5f53803737add53a21ad536c');
                }),
          )),
        ],
      )),
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
                    controller: _controller,
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
                    // var url = "http://$ipaddr/cgi-bin/rmm.py?x=$commandName";
                    var url =
                        "http://54.160.88.233/cgi-bin/rmm.py?x=$commandName";
                    var result = await http.get(url);
                    var data = result.body;
                    setState(() {
                      msgLine = "Output of the $commandName comamnd is: ";
                      op = data;
                    });
                    print(data);
                    Fluttertoast.showToast(
                      msg: data,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                    );
                    _controller.clear();
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
