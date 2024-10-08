import 'package:flutter/material.dart';

class SelectSize extends StatefulWidget {
  const SelectSize({Key? key}) : super(key: key);

  @override
  State<SelectSize> createState() => _SelectSizeState();
}

class _SelectSizeState extends State<SelectSize> {
  List<bool> _isSelected = List.generate(9, (_) => false); // Initialiser toutes les tailles à non sélectionnées

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0, // Espacement horizontal entre les boutons
      runSpacing: 8.0, // Espacement vertical entre les lignes de boutons
      children: List.generate(
        9,
        (index) {
          final size = index + 39;
          return ElevatedButton(
            onPressed: () {
              setState(() {
                // Gérer la sélection de la taille ici
                _isSelected = List.generate(9, (_) => false);
                _isSelected[index] = true;
              });
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                _isSelected[index] ? Colors.green : Colors.grey.shade300,
              ),
               foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            child: Text(size.toString()),
          );
        },
      ),
    );
  }
}
