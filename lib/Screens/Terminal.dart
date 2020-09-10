import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Terminal extends StatefulWidget {
  var ipaddr;
  Terminal({this.ipaddr});
  @override
  _TerminalState createState() => _TerminalState(ipaddr);
}

class _TerminalState extends State<Terminal> {
  var ipaddr;
  _TerminalState(this.ipaddr);
  var op = " ";
  var msgLine = " ";
  String commandName = " ";
  var _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1e1e1e),
      ),
      body: Container(
        color: Color(0xFF1e1e1e),
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "user@terminal:~ ",
                      style: TextStyle(fontSize: 15, color: Color(0xFF266de4)),
                    ),
                    Expanded(
                      child: TextField(
                          controller: _controller,
                          autofocus: true,
                          showCursor: true,
                          cursorColor: Colors.white,
                          cursorWidth: 6,
                          style: TextStyle(color: Colors.white, fontSize: 15),
                          decoration: InputDecoration.collapsed(hintText: ""),
                          onChanged: (x) {
                            commandName = x;
                          },
                          onSubmitted: (x) async {
                            print("done");
                            var url =
                                "http://54.160.88.233/cgi-bin/rmm.py?x=$commandName";
                            var result = await http.get(url);
                            var data = result.body;
                            setState(() {
                              msgLine = "user@terminal:~ ";
                              op = data;

                              print(op);
                            });
                          }),
                    )
                  ],
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('$msgLine',
                          style: TextStyle(
                              fontSize: 15, color: Color(0xFF266de4))),
                      Text(
                        '$op',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
