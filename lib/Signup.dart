// ignore_for_file: non_constant_identifier_names

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  Widget? namechk = const Icon(Icons.check_circle_outline),
      mailchk = const Icon(Icons.check_circle_outline),
      nochk = const Icon(Icons.check_circle_outline);
  final passwordcontroller = TextEditingController();
  bool passshow = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passshow = true;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // ignore: sized_box_for_whitespace
                  InkWell(
                    // ignore: sized_box_for_whitespace
                    child: Container(
                      height: 50,
                      width: 50,
                      child: const Icon(
                        Icons.arrow_back_sharp,
                        color: Colors.blue,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  const Text(
                    "Let's get Started",
                    style: TextStyle(
                        fontSize: 35,
                        fontFamily: "Tiltwrap",
                        color: Colors.blueGrey),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 320,
                          child: TextField(
                            decoration: const InputDecoration(
                              hintText: "Name",
                            ),
                            onChanged: (val) {
                              nameValidator(val);
                            },
                          ),
                        ),
                        Container(
                          child: namechk,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 320,
                          child: TextField(
                            decoration: const InputDecoration(
                              hintText: "Email",
                            ),
                            onChanged: (val) {
                              Mailvalidato(val);
                            },
                          ),
                        ),
                        Container(
                          child: mailchk,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 320,
                          child: TextField(
                            decoration: const InputDecoration(
                              hintText: "Mobile Number",
                            ),
                            onChanged: (val) {
                              MobilNoValidator(val);
                            },
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Container(
                          child: nochk,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const TextField(
                      decoration: InputDecoration(
                          hintText: "Organization(optional)",
                          border: UnderlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          hintText: "Password",
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  passshow = !passshow;
                                });
                              },
                              icon: Icon(
                                passshow
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.grey,
                              ))),
                      controller: passwordcontroller,
                      obscureText: passshow,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FlutterPwValidator(
                        width: 330,
                        numericCharCount: 1,
                        uppercaseCharCount: 1,
                        normalCharCount: 1,
                        specialCharCount: 1,
                        height: 95,
                        minLength: 10,
                        onSuccess: passwordvalidator,
                        controller: passwordcontroller),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("By signing up, I agree to"),
                        TextButton(
                            onPressed: () {},
                            child: const Text("Terms and Condition*")),
                      ],
                    ),
                    Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(25)),
                      child: const Center(
                          child: Text(
                        "Send verification Code",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w300),
                      )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account?"),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Sign In"))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void nameValidator(String name) {
    if (name.isEmpty) {
      setState(() {
        namechk = const Icon(
          Icons.check_circle_outline,
          color: Colors.black,
        );
      });
    } else if (name.length >= 8) {
      setState(() {
        namechk = const Icon(
          Icons.check_circle_outline,
          color: Colors.green,
        );
      });
    } else {
      setState(() {
        namechk = const Icon(
          Icons.close,
          color: Colors.red,
        );
      });
    }
  }

  void Mailvalidato(String mail) {
    if (mail.isEmpty) {
      setState(() {
        mailchk = const Icon(Icons.check_circle_outline);
      });
    } else if (EmailValidator.validate(mail, true)) {
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

  void MobilNoValidator(String num) {
    if (num.length > 10 || num.length < 10) {
      setState(() {
        nochk = const Icon(
          Icons.check_circle_outline,
          color: Colors.red,
        );
      });
    } else {
      setState(() {
        nochk = const Icon(
          Icons.check_circle_outline,
          color: Colors.green,
        );
      });
    }
  }

  void passwordvalidator() {
    print(passwordcontroller);
  }
}
