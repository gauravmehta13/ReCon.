import 'package:flutter/material.dart';

class DisclaimerPage extends StatefulWidget {
  @override
  _DisclaimerPageState createState() => _DisclaimerPageState();
}

class _DisclaimerPageState extends State<DisclaimerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  child: Container(
                    height: 50,
                    width: 50,
                    child: Center(
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.green,
                      ),
                    ),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(25)),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
