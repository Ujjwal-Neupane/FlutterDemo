import 'package:flutter/material.dart';
import 'package:flutter_learn_demo/services/auth_service.dart';

class AuthLogin extends StatelessWidget {
  AuthLogin({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> doLogin(BuildContext context) async {
    AuthService _auth = AuthService();
    _auth.signIn(emailController.text, passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
              child: Column(
            children: [
              Image.asset(
                'assets/images/flutter.png',
                scale: 2.5,
              ),
              SizedBox(height: 30),
              Text(
                'Firebase Login',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 28,
                    color: Colors.grey[700]),
              ),
              SizedBox(height: 30),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter Email',
                  labelText: 'Email',
                  icon: Icon(Icons.face),
                ),
                textInputAction: TextInputAction.next,
                controller: emailController,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Enter Password',
                    labelText: 'Password',
                    icon: Icon(Icons.lock)),
                textInputAction: TextInputAction.done,
                controller: passwordController,
              ),
              SizedBox(height: 45),
              ElevatedButton(
                onPressed: () => doLogin(context),
                child: Text(
                  'Login',
                  style: TextStyle(),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue, minimumSize: Size(120, 36)),
              )
            ],
          )),
        ),
      ),
    );
  }
}
