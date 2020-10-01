import 'package:flutter/material.dart';
import 'package:newUI/pages/getIp.dart';

class DisclaimerPage extends StatefulWidget {
  @override
  _DisclaimerPageState createState() => _DisclaimerPageState();
}

class _DisclaimerPageState extends State<DisclaimerPage> {
  bool _isRead = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      print("object");
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => GetIP()));
                    },
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
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
                      child: Center(
                          child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.green,
                      )),
                    ),
                  )
                ],
              ),
              Hero(
                tag: 'image',
                child: Container(
                  height: MediaQuery.of(context).size.width * .8,
                  width: MediaQuery.of(context).size.width * .8,
                  margin:
                      EdgeInsets.all(MediaQuery.of(context).size.width / 10),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/warn.png'),
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
              Expanded(
                  child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Warning',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 35,
                          fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Text(
                        'This app needs to be setup first otherwise it will not work properly.Please read the setup instruction first',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
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
                      child: Center(
                          child: Text(
                        'Setup Instructions',
                        style: TextStyle(color: Colors.green, fontSize: 15),
                      )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                            value: _isRead,
                            activeColor: Colors.green,
                            onChanged: (bool newValue) {
                              setState(() {
                                _isRead = newValue;
                              });
                            }),
                        Expanded(
                          child: Text(
                              "i have read the setup instruction carefully and understand it"),
                        )
                      ],
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
