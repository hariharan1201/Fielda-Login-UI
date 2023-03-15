import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_app/Login.dart';
import 'package:login_app/Signup.dart';
import 'package:login_app/component/splashbox.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    // ignore: todo
    // TODO: implement initState
    Timer(const Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Login()));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 75, 15, 0),
        child: Column(
          children: [
            Container(
              height: 450,
              width: 400,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.blue)),
              child: PageView(
                children: const [
                  Splashbox(
                    Head: "Track your work",
                    description:
                        "Monitor,Track and Map field work Anywhere, Anytime",
                  ),
                  Splashbox(
                      Head: "Add real-world detial",
                      description: "No paper Trail,Stay real-time,Stay mobile"),
                  Splashbox(
                      Head: "Stay Connected",
                      description: "Leverage GIS for tracking yor activity")
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            InkWell(
              child: Container(
                height: 60,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30)),
                child: const Center(
                    child: Text(
                  "I am New Here",
                  style: TextStyle(
                      fontFamily: "Tiltwrap",
                      color: Colors.white,
                      fontSize: 20),
                )),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => const Signup())));
              },
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              child: Container(
                height: 60,
                width: 250,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(30)),
                child: const Center(
                  child: Text(
                    "I Have an account already",
                    style: TextStyle(
                        fontFamily: "Tiltwrap",
                        color: Colors.blue,
                        fontSize: 15),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Login()));
              },
            )
          ],
        ),
      )),
    );
  }
}
