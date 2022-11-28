// ignore_for_file: prefer_const_constructors, override_on_non_overriding_member, avoid_print
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vqstandards_beta/Screens/AuthScreens/Modals/user.dart';
import 'package:vqstandards_beta/Screens/MainScreens/Authenticate.dart';
import 'Screens/MainScreens/HomeScreen.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Usser?>(context);
    print(user);

    if (user == null) {
      return Authenticate();
    } else {
      return HomeScreen();
    }
  }
}
