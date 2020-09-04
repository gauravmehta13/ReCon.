import 'package:flutter/material.dart';

class Disclaimer extends StatefulWidget {
  @override
  _DisclaimerState createState() => _DisclaimerState();
}

class _DisclaimerState extends State<Disclaimer> {
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
            Text(
              'NOTICE',
              style: TextStyle(
                  color: Colors.red, fontWeight: FontWeight.w500, fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'This App Needs to be Setup First otherwise It will not work Properly, Please Read the Setup Instructions first',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () {},
              child: Text('Setup Instructions'),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Checkbox(
                  value: false,
                  onChanged: null,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 110,
                  child: Text(
                    'Proceed Only if you have read setup instructions carefully and understood it.',
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/IpAddress');
              },
              child: Text('Next'),
            )
          ],
        ),
      ),
    );
  }
}
