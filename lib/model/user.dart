import 'package:firebase_auth/firebase_auth.dart';

class User {
  String id;

  User.fromFireBase(FirebaseUser user) {
    id = user.uid;
  }
}