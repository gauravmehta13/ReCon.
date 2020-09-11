import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'Output.dart';

var imagename, cName, cmd, nName, output;
var tag = "latest";

class Docker extends StatefulWidget {
  var ipaddr;
  Docker({this.ipaddr});
  @override
  _DockerState createState() => _DockerState(ipaddr);
}

class _DockerState extends State<Docker> {
  var ipaddr;
  _DockerState(this.ipaddr);
  dockerPull(imagename, {tag = 'latest'}) async {
    var url = 'http://$ipaddr/cgi-bin/rmm.py?x=docker pull$imagename:$tag';
    var response = await http.get(url);
    print(response.body);
    output = response.body;
  }

  dokckerRun(imagename, tag, cName) async {
    var url =
        'http://$ipaddr/cgi-bin/rmm.py?x=docker container run -dit --name $cName $imagename:$tag';
    var response = await http.get(url);
    print(response.body);
    output = response.body;
  }

  imageDel(imagename, tag) async {
    var url =
        'http://$ipaddr/cgi-bin/rmm.py?x=docker image rm -f $imagename:$tag';
    var response = await http.get(url);
    print(response.body);
    output = response.body;
  }

  containerDel(cName) async {
    var url = 'http://$ipaddr/cgi-bin/rmm.py?x=docker container rm -f $cName';
    var response = await http.get(url);
    print(response.body);
    output = response.body;
  }

  dockerExec(cName, cmd) async {
    var url =
        'http://$ipaddr/cgi-bin/rmm.py?x=sudo docker container exec $cName $cmd';
    var response = await http.get(url);
    print(response.body);
    output = response.body;
  }

  dockerCommit(cName, nName, tag) async {
    var url =
        'http://$ipaddr/cgi-bin/rmm.py?x=docker commit $cName $nName:$tag';
    var response = await http.get(url);
    print(response.body);
    output = response.body;
  }

  dockerStart(cName) async {
    var url = 'http://$ipaddr/cgi-bin/rmm.py?x=docker container start $cName';
    var response = await http.get(url);
    print(response.body);
    output = response.body;
  }

  dockerStop(cName) async {
    var url = 'http://$ipaddr/cgi-bin/rmm.py?x=docker container stop $cName';
    var response = await http.get(url);
    print(response.body);
    output = response.body;
  }

  listcontainers() async {
    var url = 'http://$ipaddr/cgi-bin/rmm.py?x=docker ps –a';
    var response = await http.get(url);
    print(response.body);
    output = response.body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Docker Tools'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.assignment),
              onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => Output())),
            ),
            IconButton(
              icon: Icon(Icons.help_outline),
              onPressed: () => Navigator.of(context).pushNamed('/docker_help'),
            ),
          ],
        ),
        body: Align(
          alignment: Alignment.topCenter,
          child: Container(
            //    color: Colors.blue,
            width: MediaQuery.of(context).size.width * 0.90,
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
              SizedBox(height: 30),
              //Pull Docker Image
              ExpansionTile(
                title: Text('Pull Docker Image'),
                leading: FaIcon(FontAwesomeIcons.docker),
                children: <Widget>[
                  Column(children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Enter Image Name",
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (x) {
                          imagename = x;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Enter Tag {Type latest if not sure}",
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (x) {
                          tag = x;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                        child: Text('Execute'),
                        onPressed: () {
                          print(ipaddr);
                          dockerPull(imagename, tag: tag);
                          /*Navigator.of(context).push(new MaterialPageRoute(
                              builder: (BuildContext context) => Docker_Output()));*/
                          /* Fluttertoast.showToast(
                              msg: data,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.yellowAccent,
                              textColor: Colors.black,
                              fontSize: 16.0);*/
                        })
                  ])
                ],
              ),
              SizedBox(height: 30),
              //Run Docker Container
              ExpansionTile(
                title: Text('Run Docker Container'),
                leading: FaIcon(FontAwesomeIcons.docker),
                children: <Widget>[
                  Column(children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Enter Image Name",
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (x) {
                          imagename = x;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Enter Tag {Type lastest if not sure}",
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (x) {
                          tag = x;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Enter Preffered Container Name",
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (x) {
                          cName = x;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                        child: Text('Execute'),
                        onPressed: () {
                          dokckerRun(imagename, tag, cName);
                        })
                  ])
                ],
              ),
              SizedBox(height: 30),
              //Delete Docker Image
              ExpansionTile(
                title: Text('Delete Docker Image'),
                leading: FaIcon(FontAwesomeIcons.docker),
                children: <Widget>[
                  Column(children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Enter the Image You Want to Delete",
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (x) {
                          imagename = x;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Enter Tag {Type lastest if not sure}",
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (x) {
                          tag = x;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                        child: Text('Delete'),
                        onPressed: () {
                          imageDel(imagename, tag);
                        })
                  ])
                ],
              ),
              SizedBox(height: 30),
              //Delete Docker Container
              ExpansionTile(
                title: Text('Delete Docker Container'),
                leading: FaIcon(FontAwesomeIcons.docker),
                children: <Widget>[
                  Column(children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Container Name To delete",
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (x) {
                          cName = x;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                        child: Text('Delete'),
                        onPressed: () {
                          containerDel(cName);
                        })
                  ])
                ],
              ),
              SizedBox(height: 30),
              //Execute Command in Container
              ExpansionTile(
                title: Text('Execute Command in Container'),
                leading: FaIcon(FontAwesomeIcons.docker),
                children: <Widget>[
                  Column(children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    RaisedButton(
                        child: Text('List Running Containers'),
                        onPressed: () {}),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Container Name",
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (x) {
                          cName = x;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Enter The Command",
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (x) {
                          cmd = x;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                        child: Text('Execute'),
                        onPressed: () {
                          dockerExec(cName, cmd);
                        })
                  ])
                ],
              ),
              SizedBox(height: 30),
              //Docker Commit
              ExpansionTile(
                title: Text('Convert Container to Image'),
                leading: FaIcon(FontAwesomeIcons.docker),
                children: <Widget>[
                  Column(children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    RaisedButton(
                        child: Text('List Running Containers'),
                        onPressed: () {}),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Enter Container Name",
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (x) {
                          cName = x;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Name the New Image",
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (x) {
                          nName = x;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Tag name",
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (x) {
                          tag = x;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                        child: Text('Execute'),
                        onPressed: () {
                          dockerCommit(cName, nName, tag);
                        })
                  ])
                ],
              ),
              SizedBox(height: 30),
              ExpansionTile(
                title: Text('Start A container'),
                leading: FaIcon(FontAwesomeIcons.docker),
                children: <Widget>[
                  Column(children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    RaisedButton(
                        child: Text('List Running Containers'),
                        onPressed: () {}),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Enter Container Name",
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (x) {
                          cName = x;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                        child: Text('Execute'),
                        onPressed: () {
                          dockerStart(cName);
                        })
                  ])
                ],
              ),
              SizedBox(height: 30),
              ExpansionTile(
                title: Text('Stop A container'),
                leading: FaIcon(FontAwesomeIcons.docker),
                children: <Widget>[
                  Column(children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    RaisedButton(
                        child: Text('List Running Containers'),
                        onPressed: () {}),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Enter Container Name",
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (x) {
                          cName = x;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                        child: Text('Execute'),
                        onPressed: () {
                          dockerStop(cName);
                        })
                  ])
                ],
              ),
              SizedBox(height: 30),
            ])),
          ),
        )
        /*Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(5),
        color: Colors.amber.shade200,
        child: Column(
          children: <Widget>[
            Container(
              child: InkWell(
                onTap: () => print('tapped'),
                child: Card(
                  elevation: 5,
                  color: Colors.cyan.shade100,
                  child: Text(
                    'Docker Image Queries',
                    style: TextStyle(fontSize: 30),
                  ), 
                ),
              ),
            ),
            Container(
              child: InkWell(
                onTap: () => print('tapped'),
                child: Card(
                elevation: 5,
                color: Colors.cyan.shade100,
                child: Text(
                  'Docker Run Queries',
                  style: TextStyle(fontSize: 30),  
                  ),
                ),
              ),
            ),
          ],
        ),
      ),*/
        );
  }
}
