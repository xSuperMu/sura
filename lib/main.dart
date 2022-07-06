import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sura/models/screens/home.dart';
import 'package:sura/themes/constants.dart';
import 'models/screens/Onboarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;
  runApp(MyApp(showHome: showHome));
}

class MyApp extends StatelessWidget {
  final bool showHome;
  const MyApp({Key? key, required this.showHome}) : super(key: key);

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: const TextTheme(
            bodyText1: TextStyle(fontSize: 20.0),
            bodyText2: TextStyle(fontSize: 18.0),
            button: TextStyle(fontSize: 18.0),
          ),
          fontFamily: montserrat,
        ),
        home: showHome ? Home() : Onboarding());
  }
}
