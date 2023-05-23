// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:login_app/Login.dart';
import 'package:login_app/Signup.dart';
import 'package:login_app/component/splashbox.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:after_layout/after_layout.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  PageController pagecontrl = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowIndicator();
          return true;
        },
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 75, 15, 0),
            child: Column(
              children: [
                Container(
                  height: 450,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: PageView(
                    controller: pagecontrl,
                    children: const [
                      Splashbox(
                        Head: "Track your work",
                        description:
                            "Monitor,Track and Map field work Anywhere, Anytime",
                        Imageval: "Images/1.jpg",
                      ),
                      Splashbox(
                        Head: "Add real-world detial",
                        description:
                            "No paper Trail,Stay real-time,Stay mobile",
                        Imageval: "Images/2.jpg",
                      ),
                      Splashbox(
                          Head: "Stay Connected",
                          description:
                              "Leverage GIS for tracking your activity",
                          Imageval: "Images/3.jpg")
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SmoothPageIndicator(
                  controller: pagecontrl,
                  count: 3,
                  effect: const SlideEffect(
                      spacing: 12.0,
                      radius: 10.0,
                      dotWidth: 8.0,
                      dotHeight: 8.0,
                      paintStyle: PaintingStyle.fill,
                      dotColor: Colors.black26,
                      strokeWidth: 1.5,
                      activeDotColor: Colors.blue),
                ),
                const SizedBox(
                  height: 100,
                ),
                InkWell(
                  child: Container(
                    height: 50,
                    width: 350,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30)),
                    child: const Center(
                        child: Text(
                      "I am New Here",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const Signup())));
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  child: Container(
                    height: 50,
                    width: 350,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(30)),
                    child: const Center(
                      child: Text(
                        "I Have an account already",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 18),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const Login()));
                  },
                )
              ],
            ),
          ),
        ]),
      )),
    );
  }
}
