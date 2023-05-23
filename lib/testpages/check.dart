import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Check extends StatefulWidget {
  const Check({super.key});

  @override
  State<Check> createState() => _CheckState();
}

class _CheckState extends State<Check> {
  bool action = false;
  final one = TextEditingController();
  final two = TextEditingController();
  WebViewController weeb = WebViewController();
  Widget? errormsg;
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    weeb = WebViewController()
      ..loadRequest(
          Uri.parse('https://onepiece.fandom.com/wiki/One_Piece_Wiki'));
    action = false;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(), hintText: "Password"),
                onChanged: (val) {
                  upperValidation(val);
                  lowervalidation(val);
                  Numericvalidation(val);
                  length(val);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 100,
                width: 400,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: upperA,
                    ),
                    Container(
                      child: LowerA,
                    ),
                    Container(
                      child: Numeric,
                    ),
                    Container(
                      child: len,
                    )
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Container(
                              height: 500,
                              width: 450,
                              child: WebViewWidget(controller: weeb),
                            ),
                          );
                        });
                  },
                  child: const Text("Pop up")),
              Container(
                height: 300,
                width: 400,
                color: const Color.fromARGB(255, 249, 249, 226),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: one,
                        onChanged: (val) {
                          ButtonActivator(val);
                        },
                        decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: two,
                        onChanged: (val) {
                          ButtonActivator(val);
                        },
                        decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: action ? () {} : null,
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder()),
                        child: const Center(
                          child: Text("Sign In"),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void ButtonActivator(Null) {
    if (one.text.isEmpty || two.text.isEmpty) {
      setState(() {
        action = false;
      });
    } else {
      setState(() {
        action = true;
      });
    }
  }

  void Emailvalido(String val) {
    if (val.isEmpty) {
      setState(() {
        errormsg = const Icon(
          Icons.check_box_outline_blank,
          color: Colors.white,
        );
      });
    } else if (EmailValidator.validate(val, true, true)) {
      setState(() {
        errormsg = const Icon(
          Icons.check,
          color: Colors.green,
        );
      });
    } else {
      setState(() {
        errormsg = const Icon(
          Icons.close,
          color: Colors.red,
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
      });
    } else {
      setState(() {
        upperA = const Text(
          "A",
          style: TextStyle(color: Colors.red, fontSize: 35),
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
      });
    } else {
      setState(() {
        LowerA = const Text(
          "a",
          style: TextStyle(fontSize: 35, color: Colors.red),
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
      });
    } else {
      setState(() {
        Numeric = const Text(
          "1",
          style: TextStyle(fontSize: 35, color: Colors.red),
        );
      });
    }
  }

  void length(String val) {
    if (val.length < 8) {
      setState(() {
        len = const Text(
          "8+",
          style: TextStyle(fontSize: 35, color: Colors.red),
        );
      });
    } else {
      setState(() {
        len = const Text(
          "8+",
          style: TextStyle(fontSize: 35, color: Colors.green),
        );
      });
    }
  }
}
