import 'package:flutter/material.dart';
import 'package:login_app/Signup.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  String mail = "hariharan.kanini@gmail.com";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        constraints: const BoxConstraints.expand(),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            "Account created",
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            "Please enter the code we sent to",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          Text(
            mail,
            style: const TextStyle(fontSize: 18),
          ),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Want to change the email?",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              )),
          const SizedBox(
            height: 30,
          ),
          OtpTextField(
            showFieldAsBox: true,
            showCursor: false,
            borderWidth: 0.5,
            numberOfFields: 6,
            borderRadius: BorderRadius.circular(10),
            borderColor: Colors.white,
            enabledBorderColor: Colors.grey,
            disabledBorderColor: Colors.white,
            focusedBorderColor: Colors.black,
          ),
          TextButton(
              onPressed: () {},
              child: const Text(
                "Resend the activation code",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              )),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 200,
            height: 35,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
              child: const Text("Complete Signup"),
            ),
          )
        ]),
      )),
    );
  }
}
