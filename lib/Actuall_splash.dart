import 'dart:async';
import 'package:login_app/component/splashcntrl.dart';
import 'package:login_app/splash.dart';

import 'Login.dart';
import 'package:flutter/material.dart';

class ActualSplash extends StatefulWidget {
  const ActualSplash({super.key});

  @override
  State<ActualSplash> createState() => _ActualSplashState();
}

class _ActualSplashState extends State<ActualSplash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 1), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const SplashControl()));
    });
  }

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
