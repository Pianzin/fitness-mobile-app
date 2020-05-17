import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/model/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User> signWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return User.fromFireBase(result.user);
    } catch(e) {
      print(e);
      return null;
    }
  }

  Future<User> registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return User.fromFireBase(result.user);
    } catch(e) {
      print(e);
      return null;
    }
  }

  Future logOut() async {
    await _auth.signOut();
  }

  Stream<User> get currentUser {
    return _auth.onAuthStateChanged.map((event) => event != null ? User.fromFireBase(event) : null);
  }

}