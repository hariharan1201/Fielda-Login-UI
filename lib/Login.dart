import 'package:flutter/material.dart';
import 'package:login_app/Signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 200, 10, 0),
                child: Column(
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
                      height: 10,
                    ),
                    const Text(
                      "\tSign in to explore Fielda",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w200),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const TextField(
                        decoration: InputDecoration(
                            hintText: "Email",
                            focusedBorder: UnderlineInputBorder(),
                            enabledBorder: UnderlineInputBorder())),
                    const SizedBox(
                      height: 30,
                    ),
                    const TextField(
                      decoration: InputDecoration(
                          hintText: "Password",
                          border: UnderlineInputBorder(),
                          enabledBorder: UnderlineInputBorder(),
                          focusedBorder: UnderlineInputBorder()),
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.blue),
                        child: const Center(
                            child: Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        )),
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
                height: 20,
              ),
              Container(
                height: 50,
                color: Colors.tealAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "New to Fielda?",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
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
                              fontWeight: FontWeight.w400, fontSize: 15),
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Text(
                  "About Fielda",
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
              )
            ],
          ),
        ));
  }
}
