import 'package:flutter/material.dart';

class Ecran1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Morpion',
            style: TextStyle(fontSize: 100.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10.0),
          ElevatedButton(
            onPressed: () {
              // Action à effectuer lors du clic sur le bouton "Play"
            },
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              ),
              textStyle: MaterialStateProperty.all<TextStyle>(
                const TextStyle(fontSize: 45.0),
              ),
            ),
            child: const Text('Play'),
          ),
        ],
      ),
    );
  }
}
