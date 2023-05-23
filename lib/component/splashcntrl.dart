// ignore_for_file: use_build_context_synchronously

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Login.dart';
import '../splash.dart';

class SplashControl extends StatefulWidget {
  const SplashControl({super.key});

  @override
  State<SplashControl> createState() => _SplashControlState();
}

class _SplashControlState extends State<SplashControl>
    with AfterLayoutMixin<SplashControl> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool seen = (prefs.getBool('seen') ?? false);

    if (seen) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Login()));
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Splash()));
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 219, 236, 240),
      body: Center(
        child: Image(
          image: AssetImage('Images/Fileda Logo.jpg'),
          height: 100,
          width: 250,
        ),
      ),
    );
  }
}
