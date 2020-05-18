import 'package:fitness/model/enum/level.dart';
import 'package:fitness/model/workout.dart';
import 'package:flutter/material.dart';

class WorkoutsList extends StatefulWidget {
  WorkoutsList({Key key}) : super(key: key);

  @override
  _WorkoutsListState createState() => _WorkoutsListState();
}

class _WorkoutsListState extends State<WorkoutsList> {
  @override
  void initState() {
    clearFilter();
    super.initState();
  }


  final workouts = <Workout> [
    Workout(title: 'Test1', author: 'Stanislav', description: 'Desc 1', level: LevelEnum.Beginner),
    Workout(title: 'Test2', author: 'Stanislav', description: 'Desc 2', level: LevelEnum.Intermediate),
    Workout(title: 'Test3', author: 'Stanislav', description: 'Desc 3', level: LevelEnum.Advanced),
  ];

  var filterOnlyMyWorkouts = false;
  var filterTitle = '';
  var filterTitleController = TextEditingController();
  var filterLevel = 'Any Level';

  var filterText = '';
  var filterHeight = 0.0;

  @override
  Widget build(BuildContext context) {
    var filterInfo = _filterInfo();
    var filterForm = _filterForm();
    var workoutsList = _workoutsList();

    return Column(
      children: <Widget>[
        filterInfo,
        filterForm,
        workoutsList
      ],
    );
  }

  Container _filterInfo() {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 7, right: 7, bottom: 5),
      decoration: BoxDecoration(color: Colors.white.withOpacity(0.5)),
      height: 40,
      child: RaisedButton(
        child: Row(
          children: <Widget>[
            Icon(Icons.filter_list),
            Text(
              filterText,
              style: TextStyle(),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        onPressed: () => setState(() => filterHeight = filterHeight == 0.0 ? 265.0 : 0.0),
      ),
    );
  }

  AnimatedContainer _filterForm() {
    return AnimatedContainer(
      margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 7),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [

              SwitchListTile(
                  title: const Text('Only My Workouts'),
                  value: filterOnlyMyWorkouts,
                  onChanged: (bool val) => setState(() => filterOnlyMyWorkouts = val)),

              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Level'),
                items: _levelMenuItems(),
                value: filterLevel,
                onChanged: (String val) => setState(() => filterLevel = val),
              ),

              TextFormField(
                controller: filterTitleController,
                decoration: const InputDecoration(labelText: 'Title'),
                onChanged: (String val) => setState(() => filterTitle = val),
              ),

              Row(
                children: <Widget>[

                  Expanded(
                    flex: 1,
                    child: RaisedButton(
                      onPressed: () => filter(),
                      child: Text("Apply", style: TextStyle(color: Colors.white)),
                      color: Theme.of(context).primaryColor,
                    ),
                  ),

                  SizedBox(width: 10),

                  Expanded(
                    flex: 1,
                    child: RaisedButton(
                      onPressed: () => clearFilter(),
                      child: Text("Clear", style: TextStyle(color: Colors.white)),
                      color: Colors.red,
                    ),
                  ),

                ],
              ),

            ],
          ),
        ),
      ),
      duration: const Duration(milliseconds: 400),
      curve: Curves.fastOutSlowIn,
      height: filterHeight,
    );
  }

  _levelMenuItems() {
    return LevelEnum.values.map((e) => e.toShortString()).map((String value) {
      return new DropdownMenuItem<String>(
        value: value,
        child: new Text(value),
      );
    }).toList();
  }

  List<Workout> filter() {
    setState(() {
      filterText = filterOnlyMyWorkouts ? 'My Workouts' : 'All workouts';
      filterText += ' / ' + filterLevel;

      if (filterTitle.isNotEmpty) {
        filterText += ' / ' + filterTitle;
      }

      filterHeight = 0;
    });

    var list = workouts;
    return list;
  }

  List<Workout> clearFilter() {
    setState(() {
      filterText = 'All workouts/Any Level';
      filterOnlyMyWorkouts = false;
      filterTitle = '';
      filterTitleController.clear();
      filterLevel = 'Any Level';
      filterHeight = 0;
    });

    var list = workouts;
    return list;
  }

  Expanded _workoutsList() {
    return Expanded(
      child: ListView.builder(
        itemCount: workouts.length,
        itemBuilder: (context, i) => _card(context, i)
      ),
    );
  }

  Card _card(BuildContext context, int i) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
    var color;
    double indicatorLevel;

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
      default:
        color = Colors.grey;
        indicatorLevel = 0;
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