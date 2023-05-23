// ignore_for_file: non_constant_identifier_names, avoid_unnecessary_containers
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:login_app/Verification.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final name = TextEditingController();
  final mail = TextEditingController();
  final mobile = TextEditingController();
  final password = TextEditingController();
  bool button = false;
  WebViewController weeb = WebViewController();
  Widget? namechk, mailchk, nochk;
  bool passshow = false;
  Widget upperA = const Text(
    "A",
    style: TextStyle(fontSize: 25, color: Colors.grey),
  );
  Widget LowerA = const Text(
    "a",
    style: TextStyle(fontSize: 25, color: Colors.grey),
  );
  Widget Numeric = const Text(
    "1",
    style: TextStyle(fontSize: 25, color: Colors.grey),
  );
  Widget len = const Text(
    "8+",
    style: TextStyle(fontSize: 25, color: Colors.grey),
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
      ..loadRequest(Uri.parse('https://fielda.com/terms-of-service/'));
    button = false;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
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
                          fontSize: 32,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 320,
                            child: TextField(
                              controller: name,
                              decoration: const InputDecoration(
                                hintText: "Name",
                              ),
                              onChanged: (val) {
                                nameValidator(val);
                                buttonaction(Null);
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
                              controller: mail,
                              decoration: const InputDecoration(
                                hintText: "Email",
                              ),
                              onChanged: (val) {
                                Mailvalidato(val);
                                buttonaction(Null);
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
                              controller: mobile,
                              decoration: const InputDecoration(
                                hintText: "Mobile Number",
                              ),
                              onChanged: (val) {
                                MobilNoValidator(val);
                                buttonaction(Null);
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
                        controller: password,
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
                          buttonaction(Null);
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
                        height: 58,
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
                                        scrollable: false,
                                        content: SizedBox(
                                          width: 500,
                                          height: 750,
                                          child:
                                              WebViewWidget(controller: weeb),
                                        ),
                                      );
                                    });
                              },
                              child: const Text(
                                "Terms and Condition*",
                                style: TextStyle(fontSize: 15),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 45,
                        width: 400,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder()),
                          onPressed: button
                              ? () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const VerificationPage()));
                                }
                              : null,
                          child: const Text(
                            "Send verification Code",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account?",
                            style: TextStyle(fontSize: 15),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Sign In",
                                style: TextStyle(fontSize: 15),
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
      ),
    );
  }

  void buttonaction(Null) {
    if (name.text.isEmpty ||
        mail.text.isEmpty ||
        mobile.text.isEmpty ||
        password.text.length < 10) {
      setState(() {
        button = false;
      });
    } else {
      setState(() {
        button = true;
      });
    }
  }

  void nameValidator(String name) {
    if (name.isEmpty) {
      setState(() {
        namechk = null;
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
        mailchk = null;
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
    } else if (num.isEmpty) {
      setState(() {
        nochk = null;
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
          style: TextStyle(color: Colors.green, fontSize: 25),
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
          style: TextStyle(fontSize: 25, color: Colors.grey),
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
          style: TextStyle(color: Colors.red, fontSize: 25),
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
          style: TextStyle(fontSize: 25, color: Colors.green),
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
          style: TextStyle(fontSize: 25, color: Colors.grey),
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
          style: TextStyle(fontSize: 25, color: Colors.red),
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
          style: TextStyle(fontSize: 25, color: Colors.green),
        );
        Number = const Text(
          "Number",
          style: TextStyle(color: Colors.green),
        );
      });
    } else if (val.isEmpty) {
      setState(() {
        Numeric = const Text(
          "1",
          style: TextStyle(fontSize: 25, color: Colors.grey),
        );
        Number = const Text(
          "Number",
          style: TextStyle(color: Colors.grey),
        );
      });
    } else {
      setState(() {
        Numeric = const Text(
          "1",
          style: TextStyle(fontSize: 25, color: Colors.red),
        );
        Number = const Text(
          "Number",
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
          style: TextStyle(fontSize: 25, color: Colors.red),
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
          style: TextStyle(fontSize: 25, color: Colors.grey),
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
          style: TextStyle(fontSize: 25, color: Colors.green),
        );
        Length = const Text(
          "Characters",
          style: TextStyle(color: Colors.green),
        );
      });
    }
  }
}
