import 'package:fitness/model/enum/level.dart';

class Workout {
  String title;
  String author;
  String description;
  LevelEnum level;

  Workout({this.title, this.author, this.description, this.level});
}