
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AdressDialog extends StatelessWidget {
 final controller ;
 void Function()? onPressed;
   AdressDialog({super.key, required this.controller, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.green,
      content:  SizedBox(
      height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
         TextField(
          controller: controller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            filled: true,
            fillColor: Colors.white,
            hintText: 'entrez votre adresse'
          ),
        ),

        MaterialButton(
          onPressed: onPressed,
          child: const Text('Buy Now'),
          )
        ],),

     ),

    );
  }
}