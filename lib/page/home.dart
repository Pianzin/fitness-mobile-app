import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fitness/component/activeWorkouts.dart';
import 'package:fitness/service/auth.dart';
import 'package:flutter/material.dart';

import '../component/workoutsList.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int sectionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: Text('Fitness'),
          leading: Icon(Icons.fitness_center),
          actions: <Widget>[
            _logoutButton(),
          ],
        ),
        body: sectionIndex == 0 ? ActiveWorkouts() : WorkoutsList(),
        bottomNavigationBar: _bottomNavigationBar(),
      ),
    );
  }

  FlatButton _logoutButton() {
    return FlatButton.icon(
        onPressed: () {
          AuthService().logOut();
        },
        icon: Icon(Icons.exit_to_app, color: Colors.white),
        label: SizedBox.shrink()
    );
  }

  CurvedNavigationBar _bottomNavigationBar() {
    return CurvedNavigationBar(
      items: <Widget>[
        Icon(Icons.fitness_center, size: 30),
        Icon(Icons.search, size: 30),
      ],
      height: 50,
      color: Colors.white.withOpacity(0.8),
      backgroundColor: Theme.of(context).primaryColor,
      index: sectionIndex,
      animationCurve: Curves.easeInOut,
      animationDuration: Duration(milliseconds: 400),
      onTap: (int index) => setState(() => sectionIndex = index),
    );
  }
}