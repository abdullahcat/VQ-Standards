// ignore_for_file: prefer_const_constructors, file_names

import 'package:cupertino_onboarding/cupertino_onboarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vqstandards_beta/wrapper.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoOnboarding(
      onPressedOnLastPage: () => onDone(context),
      bottomButtonColor: Color.fromRGBO(250, 17, 79, 1),
      widgetAboveBottomButton: CupertinoButton(
        child: Text(
          'About VQ Standards & Privacy',
          style: TextStyle(
            color: Color.fromRGBO(250, 17, 79, 1),
          ),
        ),
        onPressed: () {},
      ),
      pages: [
        WhatsNewPage(
          title: Text.rich(
            TextSpan(
              style: TextStyle(fontSize: 32),
              text: "Welcome To ",
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                TextSpan(
                  text: 'VQ Standards',
                  style: TextStyle(
                    color: Color.fromRGBO(250, 17, 79, 1),
                  ),
                ),
              ],
            ),
          ),
          // ignore: prefer_const_literals_to_create_immutables
          features: [
            WhatsNewFeature(
              icon: Icon(
                Icons.verified,
                color: Color.fromRGBO(250, 17, 79, 1),
              ),
              title: const Text('Conversation Views'),
              description: const Text(
                'Choose a side-by-side or face-to-face conversation view.',
              ),
            ),
            WhatsNewFeature(
              icon: Icon(
                CupertinoIcons.map,
                color: Color.fromRGBO(250, 17, 79, 1),
              ),
              title: const Text('Auto Translate'),
              description: const Text(
                'Respond in conversations without tapping the microphone button.',
              ),
            ),
            WhatsNewFeature(
              icon: Icon(
                CupertinoIcons.wand_rays,
                color: Color.fromRGBO(250, 17, 79, 1),
              ),
              title: const Text('System-Wide Translation'),
              description: const Text(
                'Translate selected text anywhere on your iPhone.',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

void onDone(context) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('ON_BOARDING', false);
  Navigator.pushReplacement(
      context, CupertinoPageRoute(builder: (context) => const Wrapper()));
}
