// ignore_for_file: file_names, must_be_immutable, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:vqstandards_beta/Services/dimensions.dart';

// ignore: must_be_immutable
class Header1 extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overFlow;
  Header1(
      {Key? key,
      this.color = Colors.white,
      required this.text,
      this.overFlow = TextOverflow.ellipsis,
      this.size = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overFlow,
      style: TextStyle(
        color: color,
        fontSize: size == 0 ? Dimensions.font30 : size,
        fontFamily: 'Helvatica',
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class Header2 extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overFlow;
  Header2(
      {Key? key,
      this.color = const Color.fromRGBO(255, 55, 95, 1),
      required this.text,
      this.overFlow = TextOverflow.ellipsis,
      this.size = 12})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overFlow,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontFamily: 'Helvatica',
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class Header3 extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overFlow;
  Header3(
      {Key? key,
      this.color = const Color.fromRGBO(255, 55, 95, 1),
      required this.text,
      this.overFlow = TextOverflow.ellipsis,
      this.size = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overFlow,
      style: TextStyle(
        color: color,
        fontSize: size == 0 ? Dimensions.font20 : size,
        fontFamily: 'Helvatica',
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
