// ignore_for_file: file_names, unused_import, unused_local_variable, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:vqstandards_beta/Mini-Widgets/Headers.dart';
import 'package:vqstandards_beta/Screens/SettingsScreens/Personal/activity.dart';
import 'package:vqstandards_beta/Screens/SettingsScreens/Personal/profile.dart';
import 'package:vqstandards_beta/Services/auth.dart';

class SettingsStructure extends StatelessWidget {
  final AuthService _auth = AuthService();
  SettingsStructure({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Header1(text: "Settings"),
        backgroundColor: const Color.fromRGBO(255, 55, 95, 1),
        actions: [
          IconButton(
            icon: const Icon(Icons.qr_code),
            tooltip: 'Rate With QR',
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('This is a qr')));
            },
          ),
        ],
      ),
      body: SettingsList(
        platform: DevicePlatform.android,
        lightTheme: SettingsThemeData(
            leadingIconsColor: const Color.fromRGBO(255, 55, 95, 1),
            titleTextColor: const Color.fromRGBO(255, 55, 95, 1),
            settingsSectionBackground: const Color.fromARGB(255, 255, 255, 255),
            settingsListBackground: Colors.white),
        sections: [
          SettingsSection(
            title: const Text('Profile'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                onPressed: ((context) => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Profile()),
                    )),
                leading: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(50)),
                  child: CircleAvatar(
                    radius: 40,
                    child: Image.network(
                      "https://www.haberonu.com/wp-content/uploads/2020/07/Eftalya-Ya%C4%9Fc%C4%B1-sevgilisi-1.jpg",
                    ),
                  ),
                ),
                description: const Text('I love the nature.'),
                title: const Text('Eftalya Yağcı'),
              ),
            ],
          ),
          SettingsSection(
            title: const Text('General'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: const Icon(CupertinoIcons.heart_fill),
                title: const Text('Activity'),
                onPressed: ((context) => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Activity()),
                    )),
              ),
            ],
          ),
          SettingsSection(
            title: const Text('Configuration'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: const Icon(Icons.language),
                title: const Text('Language'),
                value: const Text('English'),
              ),
            ],
          ),
          SettingsSection(
            title: const Text('More'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: const Icon(Icons.info),
                title: const Text('Info'),
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.share),
                title: const Text('Share'),
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.logout),
                title: const Text('Log Out'),
                onPressed: (context) async {
                  await _auth.signOut();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
