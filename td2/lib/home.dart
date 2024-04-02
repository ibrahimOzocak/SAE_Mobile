import 'package:flutter/material.dart';
import 'package:td2_2223/EcranSettings.dart';
import 'package:td2_2223/card1.dart';
import 'package:td2_2223/card2.dart';
import 'package:td2_2223/card3.dart';
import 'package:td2_2223/cardMorpion.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;


  static List<Widget> vues = <Widget>[
    Ecran1(),
    Ecran2(),
    EcranMorpion(),
    EcranSettings(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Application MORPION',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: vues[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Card1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Card2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Card3',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
