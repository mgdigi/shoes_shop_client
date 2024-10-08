
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
   final String title;
  final String subtitle;
  final String image;

  const IntroPage({super.key, required this.title, required this.subtitle, required this.image});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.grey, Colors.white],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(image),
          ),

          const SizedBox(height: 20.0),
          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18.0,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}