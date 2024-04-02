import 'package:flutter/material.dart';
import 'package:td2_2223/api/myapi.dart';

import 'models/task.dart';

class Ecran2 extends StatelessWidget {
  final MyAPI myApi = MyAPI();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Historique des parties',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ),
          // Ajoutez d'autres widgets ici pour afficher l'historique des parties
        ],
      ),
    );
  }
}
