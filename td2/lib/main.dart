import 'package:flutter/material.dart';
import 'package:td2_2223/home.dart';
import 'package:td2_2223/mytheme.dart';

void main() {
  runApp(const MyTD2());
}

class MyTD2 extends StatelessWidget {
  const MyTD2({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = MyTheme.dark();
    return MaterialApp(theme: theme, title: 'TD2', home: Home());
  }
}
