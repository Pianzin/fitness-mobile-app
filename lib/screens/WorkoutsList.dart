import 'package:fitness/model/LevelEnum.dart';
import 'package:fitness/model/Workout.dart';
import 'package:flutter/material.dart';

class WorkoutsList extends StatelessWidget {
  final workouts = <Workout> [
    Workout(title: 'Test1', author: 'Stanislav', description: 'Desc 1', level: LevelEnum.Beginner),
    Workout(title: 'Test2', author: 'Stanislav', description: 'Desc 2', level: LevelEnum.Intermediate),
    Workout(title: 'Test3', author: 'Stanislav', description: 'Desc 3', level: LevelEnum.Advanced),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin:  EdgeInsets.symmetric(vertical: 4),
        child: ListView.builder(
          itemCount: workouts.length,
          itemBuilder: (context, i) {
            return _card(context, i);
          },
        ),
      ),
    );
  }

  Card _card(BuildContext context, int i) {
    return Card(
      elevation: 2.0,
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(50, 65, 85, 0.9)),
        child: _cardItem(context, workouts[i]),
      ),
    );
  }

  ListTile _cardItem(BuildContext context, Workout workout) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 10),
      leading: _ListLeading(context),
      title: _cardTitle(context, workout),
      subtitle: _subtitle(context, workout),
      trailing: Icon(Icons.keyboard_arrow_right, color: Theme.of(context).textTheme.headline6.color),
    );
  }

  Text _cardTitle(BuildContext context, Workout workout) {
    return Text(
        workout.title,
        style: TextStyle(
          color: Theme.of(context).textTheme.headline6.color,
          fontWeight: FontWeight.bold,
        )
    );
  }

  Row _subtitle(BuildContext context, Workout workout) {
    var color = Colors.grey;
    double indicatorLevel = 0;

    switch(workout.level) {
      case LevelEnum.Beginner:
        color = Colors.green;
        indicatorLevel = 0.33;
        break;
      case LevelEnum.Intermediate:
        color = Colors.yellow;
        indicatorLevel = 0.66;
        break;
      case LevelEnum.Advanced:
        color = Colors.red;
        indicatorLevel = 1;
        break;
    }

    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: LinearProgressIndicator(
            backgroundColor: Theme.of(context).textTheme.headline6.color,
            value: indicatorLevel,
            valueColor: AlwaysStoppedAnimation(color),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          flex: 3,
          child: Text(workout.level.toShortString(), style: TextStyle(color: Theme.of(context).textTheme.headline6.color)),
        ),
      ],
    );
  }

  Container _ListLeading(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 15),
      child: Icon(
        Icons.fitness_center,
        color: Theme.of(context).textTheme.headline6.color,
      ),
      decoration: BoxDecoration(
        border: Border(right: BorderSide(width: 1, color: Colors.white24)),
      ),
    );
  }
}