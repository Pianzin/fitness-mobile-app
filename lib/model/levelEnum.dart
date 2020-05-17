enum LevelEnum {
  Beginner,
  Intermediate,
  Advanced,
}

extension ParseToString on LevelEnum {
  String toShortString() {
    return this.toString().split('.').last;
  }
}