import 'package:flutter/material.dart';

class Splashbox extends StatelessWidget {
  final Head;
  final description;
  const Splashbox({super.key, required this.Head, required this.description});

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
            Head,
            style: const TextStyle(
                fontFamily: "Tiltwrap", fontSize: 35, color: Colors.black54),
          ),
          Text(
            description,
            style: const TextStyle(
                fontSize: 12,
                fontFamily: "Tiltwrap",
                color: Colors.lightBlueAccent),
          )
        ],
      ),
    );
  }
}
