import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
      body: Column(
        children: [
          Container(
            color: Color(0xFFf2f0f2),
            height: MediaQuery.of(context).size.height / 2,
            child: SvgPicture.asset("assets/textfield.svg"),
          ),
          Container(
              padding: EdgeInsets.all(30),
              color: Color(0xFFf2f0f2),
              height: MediaQuery.of(context).size.height / 2,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    TextField(
                      textAlign: TextAlign.center,
                      onChanged: (x) {
                        ipaddr = x;
                      },
                      decoration: InputDecoration(
                          hintText: 'Enter the Public IP of your VM',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              //  fontWeight: FontWeight.bold,
                              color: Colors.grey[700]),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black))),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    GestureDetector(
                      onTap: () {
                        print(ipaddr);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Dashboard(
                                      ipaddr: ipaddr,
                                    )));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 40.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.greenAccent,
                          color: Colors.green,
                          elevation: 7.0,
                          child: Center(
                            child: Text(
                              'Next',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Spacer(
                      flex: 2,
                    ),
                  ])),
        ],
      ),
    );
  }
}
