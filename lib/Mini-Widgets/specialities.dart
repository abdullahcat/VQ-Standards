// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:vqstandards_beta/Services/dimensions.dart';

class Header1 extends StatelessWidget {
  Color? IconColor;
  final String? IconLabel;
  final Icons? icon;
  Header1({
    Key? key,
    this.IconColor,
    this.icon,
    this.IconLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Icon(
          Icons.safety_check,
          color: Color.fromRGBO(255, 159, 10, 1),
          size: Dimensions.font10,
        ),
        SizedBox(
          width: 7,
        ),
        Text(
          "Restaurant",
          style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0), fontSize: Dimensions.font5),
        )
      ],
    );
  }
}
