import 'package:flutter/material.dart';
import 'package:newUI/pages/terminalpage.dart';

class GetIP extends StatefulWidget {
  @override
  _GetIPState createState() => _GetIPState();
}

class _GetIPState extends State<GetIP> {
  TextEditingController ip = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            child: ListView(
          children: [
            Center(
                child: Text(
              "Enter Your IP",
              style: TextStyle(color: Colors.green, fontSize: 35),
            )),
            Hero(
              tag: 'image',
              child: Container(
                height: MediaQuery.of(context).size.width * .8,
                width: MediaQuery.of(context).size.width * .8,
                margin: EdgeInsets.all(MediaQuery.of(context).size.width / 10),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/connect.png'),
                        fit: BoxFit.contain),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(
                            4,
                            4,
                          ),
                          blurRadius: 20,
                          color: Color.fromRGBO(44, 193, 76, .3)),
                      BoxShadow(
                          offset: Offset(
                            -4,
                            -4,
                          ),
                          blurRadius: 20,
                          color: Color.fromRGBO(44, 193, 76, 0.3))
                    ]),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: ip,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: '103.10.31.21',
                  prefixIcon: Icon(Icons.computer),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => TerminalPage(
                          ipAddress: ip.text,
                        )));
              },
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 4,
                    vertical: 10),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(
                            4,
                            4,
                          ),
                          blurRadius: 20,
                          color: Color.fromRGBO(44, 193, 76, .3)),
                      BoxShadow(
                          offset: Offset(
                            -4,
                            -4,
                          ),
                          blurRadius: 20,
                          color: Color.fromRGBO(44, 193, 76, 0.3))
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Next",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 25,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.green,
                    )
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
