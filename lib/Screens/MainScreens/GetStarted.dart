// ignore_for_file: file_names, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:vqstandards_beta/Screens/MainScreens/Authenticate.dart';
import 'package:vqstandards_beta/Services/dimensions.dart';

class GetStarted extends StatelessWidget {
  GetStarted({super.key});

  final ButtonStyle getstratedbutton = TextButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: Color.fromARGB(255, 0, 0, 0),
    minimumSize: Size(Dimensions.screenWidth - 20, 60),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Color.fromRGBO(255, 55, 95, 1),
            child: Column(
              children: [
                SizedBox(
                  height: Dimensions.height70,
                ),
                Center(
                  child: Image.asset(
                    'assets/getstarted/getstartedlogo.png',
                    width: 80,
                  ),
                ),
                SizedBox(
                  height: Dimensions.height40,
                ),
                Center(
                    child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Image.network(
                    'https://freedesignfile.com/upload/2019/12/Travel-illustration-vector.jpg',
                    width: 350,
                    height: 350,
                    fit: BoxFit.cover,
                  ),
                )),
                SizedBox(
                  height: Dimensions.height40,
                ),
                Center(
                    child: Text(
                  'find the quality',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                )),
              ],
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              style: getstratedbutton,
              child: Text(
                'Get Started',
                style: TextStyle(fontSize: 18),
              ),
              onPressed: (() => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Authenticate()),
                  )),
            )));
  }
}
