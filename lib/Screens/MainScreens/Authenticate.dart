// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:vqstandards_beta/Screens/AuthScreens/register.dart';
import 'package:vqstandards_beta/Screens/AuthScreens/sign.in.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(toggleView: toggleView);
    }
    return Register(toggleView: toggleView);
  }
}
