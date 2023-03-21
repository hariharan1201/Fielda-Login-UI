// ignore_for_file: non_constant_identifier_names, avoid_unnecessary_containers

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  WebViewController weeb = WebViewController();
  Widget? namechk = const Icon(Icons.check_circle_outline),
      mailchk = const Icon(Icons.check_circle_outline),
      nochk = const Icon(Icons.check_circle_outline);
  bool passshow = false;
  Widget upperA = const Text(
    "A",
    style: TextStyle(fontSize: 35, color: Colors.grey),
  );
  Widget LowerA = const Text(
    "a",
    style: TextStyle(fontSize: 35, color: Colors.grey),
  );
  Widget Numeric = const Text(
    "1",
    style: TextStyle(fontSize: 35, color: Colors.grey),
  );
  Widget len = const Text(
    "8+",
    style: TextStyle(fontSize: 35, color: Colors.grey),
  );
  Widget Uppercase = const Text(
        "Uppercase",
        style: TextStyle(color: Colors.grey),
      ),
      LowerCase = const Text(
        "Lowercase",
        style: TextStyle(color: Colors.grey),
      ),
      Number = const Text(
        "Number",
        style: TextStyle(color: Colors.grey),
      ),
      Length = const Text(
        "Characters",
        style: TextStyle(color: Colors.grey),
      );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passshow = true;
    weeb = WebViewController()
      ..loadRequest(Uri.parse('https://www.twitter.com/'));
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
                      obscureText: passshow,
                      onChanged: (val) {
                        upperValidation(val);
                        lowervalidation(val);
                        Numericvalidation(val);
                        length(val);
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 70,
                      width: 320,
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  upperA,
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Uppercase
                                ]),
                          ),
                          Container(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  LowerA,
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  LowerCase
                                ]),
                          ),
                          Container(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Numeric,
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Number
                                ]),
                          ),
                          Container(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  len,
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Length
                                ]),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "By signing up, I agree to",
                          style: TextStyle(fontSize: 15),
                        ),
                        TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      scrollable: true,
                                      content: SizedBox(
                                        height: 600,
                                        child: WebViewWidget(controller: weeb),
                                      ),
                                    );
                                  });
                            },
                            child: const Text("Terms and Condition*")),
                      ],
                    ),
                    Container(
                      height: 50,
                      width: 300,
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
                        const Text(
                          "Already have an account?",
                          style: TextStyle(fontSize: 18),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Sign In",
                              style: TextStyle(fontSize: 18),
                            ))
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
          Icons.check_circle_outline,
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

  void upperValidation(String val) {
    RegExp Valid = RegExp(r'^(?=.*[A-Z]).{1,}$');
    if (Valid.hasMatch(val)) {
      setState(() {
        upperA = const Text(
          "A",
          style: TextStyle(color: Colors.green, fontSize: 35),
        );
        Uppercase = const Text(
          "Uppercase",
          style: TextStyle(color: Colors.green),
        );
      });
    } else if (val.isEmpty) {
      setState(() {
        upperA = const Text(
          "A",
          style: TextStyle(fontSize: 35, color: Colors.grey),
        );
        Uppercase = const Text(
          "Uppercase",
          style: TextStyle(color: Colors.grey),
        );
      });
    } else {
      setState(() {
        upperA = const Text(
          "A",
          style: TextStyle(color: Colors.red, fontSize: 35),
        );
        Uppercase = const Text(
          "Uppercase",
          style: TextStyle(color: Colors.red),
        );
      });
    }
  }

  void lowervalidation(String val) {
    RegExp Valid = RegExp(r'^(?=.*[a-z]).{1,}$');
    if (Valid.hasMatch(val)) {
      setState(() {
        LowerA = const Text(
          "a",
          style: TextStyle(fontSize: 35, color: Colors.green),
        );
        LowerCase = LowerCase = const Text(
          "lowercase",
          style: TextStyle(color: Colors.green),
        );
      });
    } else if (val.isEmpty) {
      setState(() {
        LowerA = const Text(
          "a",
          style: TextStyle(fontSize: 35, color: Colors.grey),
        );
        LowerCase = LowerCase = const Text(
          "lowercase",
          style: TextStyle(color: Colors.grey),
        );
      });
    } else {
      setState(() {
        LowerA = const Text(
          "a",
          style: TextStyle(fontSize: 35, color: Colors.red),
        );
        LowerCase = LowerCase = const Text(
          "lowercase",
          style: TextStyle(color: Colors.red),
        );
      });
    }
  }

  void Numericvalidation(String val) {
    RegExp Valid = RegExp(r'^(?=.*[0-9]).{1,}$');
    if (Valid.hasMatch(val)) {
      setState(() {
        Numeric = const Text(
          "1",
          style: TextStyle(fontSize: 35, color: Colors.green),
        );
        Number = const Text(
          "Characters",
          style: TextStyle(color: Colors.green),
        );
      });
    } else if (val.isEmpty) {
      setState(() {
        Numeric = const Text(
          "1",
          style: TextStyle(fontSize: 35, color: Colors.grey),
        );
        Number = const Text(
          "Characters",
          style: TextStyle(color: Colors.grey),
        );
      });
    } else {
      setState(() {
        Numeric = const Text(
          "1",
          style: TextStyle(fontSize: 35, color: Colors.red),
        );
        Number = const Text(
          "Characters",
          style: TextStyle(color: Colors.red),
        );
      });
    }
  }

  void length(String val) {
    if (val.length < 8 && val.length != 0) {
      setState(() {
        len = const Text(
          "8+",
          style: TextStyle(fontSize: 35, color: Colors.red),
        );
        Length = const Text(
          "Characters",
          style: TextStyle(color: Colors.red),
        );
      });
    } else if (val.isEmpty) {
      setState(() {
        len = const Text(
          "8+",
          style: TextStyle(fontSize: 35, color: Colors.grey),
        );
        Length = const Text(
          "Characters",
          style: TextStyle(color: Colors.grey),
        );
      });
    } else {
      setState(() {
        len = const Text(
          "8+",
          style: TextStyle(fontSize: 35, color: Colors.green),
        );
        Length = const Text(
          "Characters",
          style: TextStyle(color: Colors.green),
        );
      });
    }
  }
}
