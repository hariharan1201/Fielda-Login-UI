import 'package:flutter/material.dart';
import 'package:login_app/Login.dart';
import 'package:login_app/Signup.dart';
import 'package:login_app/splash.dart';
import 'package:login_app/testpages/web.dart';

import 'testpages/check.dart';

void main() {
  runApp(const MaterialApp(
    home: Splash(),
    debugShowCheckedModeBanner: false,
  ));
}
