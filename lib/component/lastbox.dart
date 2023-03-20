import 'package:flutter/material.dart';
import 'package:login_app/Login.dart';

class Lastbox extends StatelessWidget {
  final subtext;
  final head;
  const Lastbox({required this.head, required this.subtext});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.blue)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            head,
            style: const TextStyle(
                fontFamily: "Tiltwrap", fontSize: 35, color: Colors.black54),
          ),
          Text(
            subtext,
            style: const TextStyle(
                fontSize: 12,
                fontFamily: "Tiltwrap",
                color: Colors.lightBlueAccent),
          ),
          const SizedBox(
            height: 50,
          ),
          InkWell(
            child: Container(
              height: 40,
              width: 125,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: const Center(
                child: Text(
                  "Get started",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
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
    );
  }
}
