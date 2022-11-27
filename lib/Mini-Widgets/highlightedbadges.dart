// ignore_for_file: must_be_immutable, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:vqstandards_beta/Mini-Widgets/Headers.dart';

class Badges extends StatelessWidget {
  Color? color;
  final IconData icon;
  final String text;
  final Color iconColor;
  Badges(
      {Key? key,
      this.color = const Color.fromARGB(255, 38, 35, 80),
      required this.text,
      required this.icon,
      required this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        const SizedBox(width: 5),
        Header2(
          text: text,
          color: color,
        )
      ],
    );
  }
}

class HighlightedBadges extends StatelessWidget {
  double spacing;
  final IconData icon1;
  final IconData icon2;
  final IconData icon3;
  final Color iconcolor1;
  final Color iconcolor2;
  final Color iconcolor3;
  final String text1;
  final String text2;
  final String text3;
  HighlightedBadges({
    Key? key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.iconcolor1,
    required this.iconcolor2,
    required this.iconcolor3,
    required this.icon1,
    required this.icon2,
    required this.icon3,
    required this.spacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Badges(text: text1, icon: icon1, iconColor: iconcolor1),
          SizedBox(
            width: spacing,
          ),
          Badges(text: text2, icon: icon2, iconColor: iconcolor2),
          SizedBox(
            width: spacing,
          ),
          Badges(text: text3, icon: icon3, iconColor: iconcolor3),
        ],
      ),
    );
  }
}
