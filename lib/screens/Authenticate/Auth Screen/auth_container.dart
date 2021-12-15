import 'package:flutter/material.dart';
import 'package:flutter_learn_demo/screens/Authenticate/Auth%20Screen/auth_anon.dart';
import 'package:flutter_learn_demo/screens/Authenticate/Auth%20Screen/auth_login.dart';
import 'package:flutter_learn_demo/screens/Authenticate/Auth%20Screen/auth_register.dart';

class AuthContainer extends StatefulWidget {
  const AuthContainer({Key? key}) : super(key: key);

  @override
  State<AuthContainer> createState() => _AuthContainerState();
}

class _AuthContainerState extends State<AuthContainer> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Firebase Auth'),
          bottom: TabBar(tabs: const [
            Tab(icon: Icon(Icons.face), text: 'Anon Auth'),
            Tab(icon: Icon(Icons.login_outlined), text: 'Login'),
            Tab(icon: Icon(Icons.app_registration), text: 'Register')
          ]),
        ),
        body: TabBarView(
          children: [
            AuthAnon(),
            AuthLogin(),
            AuthRegister(),
          ],
        ),
      ),
    );
  }
}
