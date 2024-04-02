import 'package:flutter/material.dart';
import 'package:td2_2223/models/gameButton.dart';


class EcranMorpion extends StatelessWidget {
  late List<GameButton> buttonsList = <GameButton>[
    // give 9 piece for the game
    new GameButton(id: 1),
    new GameButton(id: 2),
    new GameButton(id: 3),
    new GameButton(id: 4),
    new GameButton(id: 5),
    new GameButton(id: 6),
    new GameButton(id: 7),
    new GameButton(id: 8),
    new GameButton(id: 9),
  ];
  var player1;
  var player2;
  var activePlayer;


  void playGame(GameButton gb){
    // give a state to the game

    if(activePlayer == 1){
      gb.text = "Be";
      gb.bg = Colors.blue;
      activePlayer = 2;
      // get id for winner function
      player1.add(gb.id);
    } else {
      gb.text = "Code";
      gb.bg = Colors.black;
      activePlayer = 1;
      // get id for winner function
      player2.add(gb.id);
    }
    gb.enabled = false;
    checkWinner();

  }

  int checkWinner(){
    var winner = -1;
    if (player1.contains(1) && player1.contains(2) && player1.contains(3)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(2) && player2.contains(3)) {
      winner = 2;
    }

    // row 2
    if (player1.contains(4) && player1.contains(5) && player1.contains(6)) {
      winner = 1;
    }
    if (player2.contains(4) && player2.contains(5) && player2.contains(6)) {
      winner = 2;
    }

    // row 3
    if (player1.contains(7) && player1.contains(8) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(7) && player2.contains(8) && player2.contains(9)) {
      winner = 2;
    }

    // col 1
    if (player1.contains(1) && player1.contains(4) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(4) && player2.contains(7)) {
      winner = 2;
    }

    // col 2
    if (player1.contains(2) && player1.contains(5) && player1.contains(8)) {
      winner = 1;
    }
    if (player2.contains(2) && player2.contains(5) && player2.contains(8)) {
      winner = 2;
    }

    // col 3
    if (player1.contains(3) && player1.contains(6) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(6) && player2.contains(9)) {
      winner = 2;
    }

    //diagonal
    if (player1.contains(1) && player1.contains(5) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(5) && player2.contains(9)) {
      winner = 2;
    }

    if (player1.contains(3) && player1.contains(5) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(5) && player2.contains(7)) {
      winner = 2;
    }

    if(winner != -1){
      if(winner == 1){


    } else {


    }
  }
    return winner;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.all(1.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
        ),
        itemCount: buttonsList.length,
        itemBuilder: (context, i) => SizedBox(
          width: 2.0,
          height: 2.0,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(8.0),
              backgroundColor: buttonsList[i].bg
            ),
            onPressed: () {
              // Logique à exécuter lorsque le bouton est pressé
              print('Button ${i + 1} pressed');
            },
            child: Text(
              buttonsList[i].text,
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),

          ),
        ),
      ),
    );
  }



}
