enum LevelEnum {
  Any_Level,
  Beginner,
  Intermediate,
  Advanced,
}

extension ParseToString on LevelEnum {
  String toShortString() {
    return this.toString().replaceAll('_', ' ').split('.').last;
  }
}