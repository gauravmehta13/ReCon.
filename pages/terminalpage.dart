import 'package:flutter/material.dart';

class TerminalPage extends StatefulWidget {
  final String ipAddress;
  TerminalPage({this.ipAddress});
  @override
  _TerminalPageState createState() => _TerminalPageState();
}

class _TerminalPageState extends State<TerminalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text("ReCon"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              //Use url launcher to go to the help page
            },
            icon: Icon(
              Icons.help,
              color: Colors.white,
              size: 35,
            ),
          ),
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              flex: 1,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Hint Text',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                //this will send command to the server
              },
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * .3),
                padding: EdgeInsets.all(10),
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(
                            4,
                            4,
                          ),
                          blurRadius: 30,
                          color: Color.fromRGBO(44, 193, 76, .4)),
                      BoxShadow(
                          offset: Offset(
                            -4,
                            -4,
                          ),
                          blurRadius: 30,
                          color: Color.fromRGBO(44, 193, 76, 0.3))
                    ]),
                child: Center(
                  child: Text(
                    'Execute',
                    style: TextStyle(color: Colors.green, fontSize: 20),
                  ),
                ),
              ),
            ),
            //this container will hold the output from the terminal
            Expanded(
              flex: 5,
              child: Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(
                            4,
                            4,
                          ),
                          blurRadius: 30,
                          color: Color.fromRGBO(44, 193, 76, .1)),
                      BoxShadow(
                          offset: Offset(
                            -4,
                            -4,
                          ),
                          blurRadius: 30,
                          color: Color.fromRGBO(44, 193, 76, 0.2))
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Output",
                      style: TextStyle(color: Colors.green, fontSize: 25),
                    ),
                    Divider(),
                    Text("This will hold the output of the terinal"),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
