// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TrackList extends StatelessWidget {
  const TrackList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: const Color.fromRGBO(247, 223, 228, 1),
      child: Center(
          child: Text("Trancking Cards is not available in beta version. ")),
      // child: ListView(
      //   padding: EdgeInsets.only(bottom: 80),
      //   // ignore: prefer_const_literals_to_create_immutables
      //   children: [
      //     trackcard(),
      //     trackcard(),
      //     trackcard(),
      //     trackcard(),
      //     trackcard(),
      //     trackcard(),
      //   ],
      // ),
    ));
  }
}
