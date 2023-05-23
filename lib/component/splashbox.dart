import 'package:flutter/material.dart';

class Splashbox extends StatelessWidget {
  final Head;
  final description;
  final Imageval;
  const Splashbox(
      {super.key,
      required this.Head,
      required this.description,
      required this.Imageval});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(Imageval),
            height: 250,
          ),
          Text(
            Head,
            style: const TextStyle(fontFamily: "Tiltwrap", fontSize: 35),
          ),
          Text(
            description,
            style: const TextStyle(
                fontSize: 15, color: Colors.black, fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}
