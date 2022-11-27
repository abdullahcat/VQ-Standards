// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:vqstandards_beta/Screens/DiscoverScreens/Discover_Structure.dart';
import 'package:vqstandards_beta/Screens/MapScreens/MapStructure.dart';
import 'package:vqstandards_beta/Screens/SettingsScreens/Settings_Structure.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;
  // ignore: prefer_final_fields
  static List<Widget> _widgetOptions = <Widget>[
    MapStructure(),
    DiscoverStructure(),
    SettingsStructure(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromRGBO(250, 17, 79, 1),
        onTap: _onItemTapped,
      ),
    );
  }
}
