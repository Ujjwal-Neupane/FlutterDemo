import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn_demo/models/user_model.dart';
import 'package:flutter_learn_demo/services/auth_service.dart';

class AuthUser extends StatefulWidget {
  const AuthUser({Key? key}) : super(key: key);

  @override
  State<AuthUser> createState() => _AuthUserState();
}

class _AuthUserState extends State<AuthUser> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  bool isReceived = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      isReceived = true;
      setState(() {});
    });
  }

  doLogOut() {
    AuthService().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome User'),
      ),
      body: Center(
          child: isReceived
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('UserId: ${loggedInUser.uid}',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('User Firstname: ${loggedInUser.firstname}',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('User Lastname: ${loggedInUser.lastname}',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('User Email: ${loggedInUser.email}',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () => doLogOut(),
                      child: Text('Log Out'),
                    ),
                  ],
                )
              : CircularProgressIndicator()),
    );
  }
}
