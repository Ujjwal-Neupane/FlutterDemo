import 'package:flutter/material.dart';
import 'package:flutter_learn_demo/services/auth_service.dart';

class AuthAnon extends StatefulWidget {
  const AuthAnon({Key? key}) : super(key: key);

  @override
  State<AuthAnon> createState() => _AuthAnonState();
}

class _AuthAnonState extends State<AuthAnon> {
  final AuthService _auth = AuthService();

  String loginStatus = 'Unknown';
  bool signOutStatus = false;

  checkLoginStatus() {
    if (AuthService().checkLoginStatus()) {
      print('Login status = true');
      loginStatus = 'User Logged In';
    } else {
      print('login status = false');
      loginStatus = 'user logged out';
    }
    setState(() {});
  }

  doSignOut() async {
    await AuthService().signOut();
    checkLoginStatus();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLoginStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () => checkLoginStatus(),
            child: Text('Check Login Status')),
        ElevatedButton(onPressed: () => doSignOut(), child: Text('Sign Out')),
        Text('Login Status: $loginStatus')
      ],
    );
  }
}
