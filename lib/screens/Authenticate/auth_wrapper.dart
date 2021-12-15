import 'package:flutter/material.dart';
import 'package:flutter_learn_demo/screens/Authenticate/Auth%20Screen/auth_container.dart';
import 'package:flutter_learn_demo/screens/Authenticate/auth_user.dart';
import 'package:flutter_learn_demo/services/auth_service.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  bool isLoggedIn = false;

  checkLogin() {
    isLoggedIn = AuthService().checkLoginStatus();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLogin();
    setState() {}
  }

  @override
  Widget build(BuildContext context) {
    return isLoggedIn ? AuthUser() : AuthContainer();
  }
}
