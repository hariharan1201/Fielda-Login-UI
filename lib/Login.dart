// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:login_app/Signup.dart';
import 'package:email_validator/email_validator.dart';
import 'package:login_app/splash.dart';
import 'package:login_app/project.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final mail = TextEditingController();
  final password = TextEditingController();
  bool button = false;
  Widget? mailchk;
  Widget? passchk;
  bool passvisib = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passvisib = true;
    button = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 200, 15, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Welcome",
                        style: TextStyle(
                            fontSize: 45,
                            fontFamily: "Tiltwrap",
                            color: Colors.blueGrey),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "\tSign in to explore Fielda",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w200),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 320,
                            child: TextField(
                              controller: mail,
                              decoration: const InputDecoration(
                                hintText: "Email",
                                focusedBorder: UnderlineInputBorder(),
                                enabledBorder: UnderlineInputBorder(),
                              ),
                              onChanged: (val) {
                                EmailValidata(val);
                                buttionaction(Null);
                              },
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                          Container(
                            child: mailchk,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 315,
                            child: TextField(
                              controller: password,
                              decoration: InputDecoration(
                                  hintText: "Password",
                                  border: UnderlineInputBorder(),
                                  enabledBorder: UnderlineInputBorder(),
                                  focusedBorder: UnderlineInputBorder(),
                                  suffixIcon: IconButton(
                                      icon: Icon(
                                        passvisib
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: Colors.grey,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          passvisib = !passvisib;
                                        });
                                      })),
                              onChanged: (val) {
                                PasswordValidator(val);
                                buttionaction(Null);
                              },
                              obscureText: passvisib,
                              keyboardType: TextInputType.visiblePassword,
                            ),
                          ),
                          Container(
                            child: passchk,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: SizedBox(
                          height: 45,
                          width: 300,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: StadiumBorder()),
                            onPressed: button
                                ? () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Project()));
                                  }
                                : null,
                            child: Center(
                                child: Text(
                              "Sign In",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            )),
                          ),
                        ),
                      ),
                      Center(
                        child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Forgot your Password?",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 15),
                            )),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 50,
                  color: Colors.tealAccent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "New to Fielda?",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w300),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Signup()));
                          },
                          child: const Text(
                            "Create Account",
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 18),
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                Center(
                  child: TextButton(
                    child: Text(
                      "About Fielda",
                      style: TextStyle(
                          fontWeight: FontWeight.w300, color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Splash()));
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void buttionaction(Null) {
    if (mail.text.isEmpty || password.text.length < 10) {
      setState(() {
        button = false;
      });
    } else {
      setState(() {
        button = true;
      });
    }
  }

  // ignore: non_constant_identifier_names
  void EmailValidata(String val) {
    if (val.isEmpty) {
      setState(() {
        mailchk = null;
      });
    } else if (EmailValidator.validate(val, true, true)) {
      setState(() {
        mailchk = const Icon(
          Icons.check_circle_outline,
          color: Colors.green,
        );
      });
    } else {
      setState(() {
        mailchk = const Icon(
          Icons.check_circle_outline,
          color: Colors.red,
        );
      });
    }
  }

  void PasswordValidator(String val2) {
    if (val2.length >= 10) {
      setState(() {
        passchk = const Icon(
          Icons.check_circle_outline,
          color: Colors.green,
        );
      });
    } else if (val2.isEmpty) {
      setState(() {
        passchk = null;
      });
    } else {
      setState(() {
        passchk = const Icon(
          Icons.check_circle_outline,
          color: Colors.red,
        );
      });
    }
  }
}
