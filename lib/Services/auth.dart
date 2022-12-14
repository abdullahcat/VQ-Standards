// ignore_for_file: avoid_print, unnecessary_null_comparison
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vqstandards_beta/Screens/AuthScreens/Modals/user.dart';
import 'package:vqstandards_beta/Services/database.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Create User Object
  Usser? _userFromFirebaseUser(User? user) {
    if (user != null) {
      return Usser(uid: user.uid);
    } else {
      return null;
    }
  }

//Auth Change User Stream

  Stream<Usser?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  // Sign in Anonym

  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign in via email & password
  Future signInWithEmailandPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      //Create New Doc For User
      await DatabaseService(uid: user!.uid)
          .updateUserData("Name", "New Member");
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  // Register via email & password

  Future registerWithEmailandPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      await DatabaseService(uid: user!.uid)
          .updateUserData("Hey, I'm using VQ", "New Member");

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign Out

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
