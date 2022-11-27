// ignore_for_file: file_names, unused_import, unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:vqstandards_beta/Mini-Widgets/Headers.dart';
import 'package:vqstandards_beta/Services/auth.dart';

class SettingsStructure extends StatelessWidget {
  final AuthService _auth = AuthService();
  SettingsStructure({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Header1(text: "Settings"),
        backgroundColor: const Color.fromRGBO(255, 55, 95, 1),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            tooltip: 'Profile',
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Profile')));
            },
          ),
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
        lightTheme:
            // ignore: prefer_const_constructors
            SettingsThemeData(
                leadingIconsColor: const Color.fromRGBO(255, 55, 95, 1),
                titleTextColor: const Color.fromRGBO(255, 55, 95, 1),
                settingsSectionBackground:
                    const Color.fromARGB(255, 255, 255, 255),
                settingsListBackground: Colors.white),
        sections: [
          SettingsSection(
            title: const Text('General'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: const Icon(Icons.flag),
                title: const Text('Visited'),
              ),
              SettingsTile.navigation(
                leading: const Icon(CupertinoIcons.heart_fill),
                title: const Text('Liked'),
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
