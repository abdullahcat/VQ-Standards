// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vqstandards_beta/Mini-Widgets/Headers.dart';

class Activity extends StatelessWidget {
  const Activity({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Header1(text: "Activity"),
              backgroundColor: const Color.fromRGBO(255, 55, 95, 1),
              bottom: const TabBar(
                indicatorColor: Colors.white,
                tabs: [
                  Tab(
                      text: "Liked",
                      icon: Icon(
                        CupertinoIcons.heart_fill,
                      )),
                  Tab(
                    icon: Icon(Icons.flag),
                    text: "Saved",
                  ),
                ],
              ),
            ),
            body: TabBarView(
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                Container(
                    padding: EdgeInsets.all(30),
                    child: ListView(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Card(
                          elevation: 10,
                          color: Theme.of(context).colorScheme.surfaceVariant,
                          child: const SizedBox(
                              width: 300,
                              height: 50,
                              child: Center(
                                child: Text.rich(
                                  TextSpan(
                                    style: TextStyle(fontSize: 20),
                                    text: "Hometown: ",
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      TextSpan(
                                        text: 'Ottawa, Canada',
                                        style: TextStyle(
                                          color: Color.fromRGBO(94, 92, 230, 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ),
                        Card(
                          elevation: 10,
                          color: Theme.of(context).colorScheme.surfaceVariant,
                          child: const SizedBox(
                              width: 300,
                              height: 50,
                              child: Center(
                                child: Text.rich(
                                  TextSpan(
                                    style: TextStyle(fontSize: 20),
                                    text: "Age: ",
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      TextSpan(
                                        text: '34',
                                        style: TextStyle(
                                          color: Color.fromRGBO(94, 92, 230, 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ),
                        Card(
                          elevation: 10,
                          color: Theme.of(context).colorScheme.surfaceVariant,
                          child: const SizedBox(
                              width: 300,
                              height: 50,
                              child: Center(
                                child: Text.rich(
                                  TextSpan(
                                    style: TextStyle(fontSize: 20),
                                    text: "Job: ",
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      TextSpan(
                                        text: 'Artist',
                                        style: TextStyle(
                                          color: Color.fromRGBO(94, 92, 230, 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ),
                        Card(
                          elevation: 10,
                          color: Theme.of(context).colorScheme.surfaceVariant,
                          child: const SizedBox(
                              width: 300,
                              height: 50,
                              child: Center(
                                child: Text.rich(
                                  TextSpan(
                                    style: TextStyle(fontSize: 20),
                                    text: "Languages: ",
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      TextSpan(
                                        text: 'German, English',
                                        style: TextStyle(
                                          color: Color.fromRGBO(94, 92, 230, 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ),
                        Card(
                          elevation: 10,
                          color: Theme.of(context).colorScheme.surfaceVariant,
                          child: const SizedBox(
                              width: 300,
                              height: 50,
                              child: Center(
                                child: Text.rich(
                                  TextSpan(
                                    style: TextStyle(fontSize: 20),
                                    text: "Degree: ",
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      TextSpan(
                                        text: 'Bachelor Degree',
                                        style: TextStyle(
                                          color: Color.fromRGBO(94, 92, 230, 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ),
                      ],
                    )),
                GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[100],
                      child: const Text("He'd have you all unravel at the"),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[200],
                      child: const Text('Heed not the rabble'),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[300],
                      child: const Text('Sound of screams but the'),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[400],
                      child: const Text('Who scream'),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[500],
                      child: const Text('Revolution is coming...'),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[600],
                      child: const Text('Revolution, they...'),
                    ),
                  ],
                )
              ],
            )));
  }
}
