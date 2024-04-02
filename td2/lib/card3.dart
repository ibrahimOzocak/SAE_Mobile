import 'package:flutter/material.dart';

class Ecran3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Règles du Morpion',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              '1. Le Morpion est un jeu pour deux joueurs, chacun utilisant un symbole différent (généralement X et O).',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              '2. Le jeu se joue sur une grille de 3x3 cases.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              '3. Le premier joueur qui parvient à aligner trois de ses symboles horizontalement, verticalement ou en diagonale remporte la partie.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              "4. Si la grille est remplie sans qu'aucun joueur n'ait aligné trois de ses symboles, la partie est déclarée nulle (match nul).",
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              '5. Les joueurs alternent les tours, plaçant un symbole sur une case vide à chaque tour.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              "6. Si l'un des joueurs parvient à aligner trois de ses symboles avant que la grille ne soit remplie, il remporte la partie. Si la grille est remplie sans qu'aucun joueur ne gagne, la partie est déclarée nulle.",
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
