import 'package:fitness/screens/AuthorizationPage.dart';
import 'package:flutter/material.dart';

import 'screens/HomePage.dart';

void main() => runApp(FitnessApp());

class FitnessApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(50, 65, 85, 1),
        textTheme: TextTheme(headline6: TextStyle(color: Colors.white))
      ),
      home: AuthorizationPage(),
    );
  }
}