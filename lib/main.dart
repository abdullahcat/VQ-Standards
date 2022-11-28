import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vqstandards_beta/Screens/AuthScreens/Modals/user.dart';
import 'package:vqstandards_beta/Screens/MainScreens/OnBoarding.dart';
import 'package:vqstandards_beta/Services/auth.dart';
import 'package:vqstandards_beta/wrapper.dart';
import 'firebase_options.dart';

bool show = true;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  final prefs = await SharedPreferences.getInstance();
  show = prefs.getBool('ON_BOARDING') ?? true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Usser?>.value(
      value: AuthService().user,
      initialData: null,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'VQ Standards Beta',
        theme: ThemeData(
          brightness: Brightness.light,
        ),
        home: show ? const OnBoarding() : const Wrapper(),
      ),
    );
  }
}
