import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_learn_demo/models/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

//sign in anynom
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//sign in email and password
  void signIn(String email, String password) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {print('login successful...')});
    } catch (e) {
      print('---LOGIN FAILED!!---');
      print('Error: $e');
    }
  }

//register email pass Authentication
  void signUp(
      String email, String password, String firstname, String lastname) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        print('reg successful...');
        postUsertoFireStore(firstname, lastname);
      });
    } on Exception catch (e) {
      print('Error: $e');
    }
  }

//send data to FireStore after Successful reg
  postUsertoFireStore(String firstname, String lastname) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? fireUser = _auth.currentUser;

    UserModel userModel = UserModel();

    userModel.uid = fireUser!.uid;
    userModel.email = fireUser.email;
    userModel.firstname = firstname;
    userModel.lastname = lastname;

    await firebaseFirestore
        .collection('users')
        .doc(userModel.uid)
        .set(userModel.toMap());
  }

//sign out
  signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  checkLoginStatus() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return true;
    }
    return false;
  }
}
