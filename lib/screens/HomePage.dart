import 'package:flutter/material.dart';

import 'WorkoutsList.dart';

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
        ),
        body: WorkoutsList(),
      ),
    );
  }
}