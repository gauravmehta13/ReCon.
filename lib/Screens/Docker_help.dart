import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Docker_help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0), // here the desired height
          child: AppBar(),
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: 50,
            ),
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: NetworkImage(
                      'https://image.slidesharecdn.com/3hourstodockerfundamentals-jumpstartyourdockerknowledge-160119215359/95/3-hours-to-docker-fundamentals-jumpstart-your-docker-knowledge-16-638.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            FloatingActionButton.extended(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                icon: Icon(Icons.live_help),
                label: Text('Click here for more info about Docker'),
                onPressed: () =>
                    launch("https://docs.docker.com/get-started/overview/"))
          ],
        ));
  }
}
