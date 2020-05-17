import 'package:fitness/service/auth.dart';
import 'package:flutter/material.dart';

import 'workoutsList.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

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
        body: WorkoutsList(),
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
}