import 'package:flutter/material.dart';
import 'package:flutter_learn_demo/utils/routes.dart';

class AuthRegister extends StatelessWidget {
  AuthRegister({Key? key}) : super(key: key);

  final TextEditingController fNameController = TextEditingController();
  final TextEditingController lNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void doRegister(context) {
    Navigator.pushNamed(context, MyRoutes.toAuthUser);
    // AuthService _auth = AuthService();
    // _auth.signUp(emailController.text, passwordController.text,
    //     fNameController.text, lNameController.text);
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
                'Firebase Register',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 28,
                    color: Colors.grey[700]),
              ),
              SizedBox(height: 30),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter Firstname',
                  labelText: 'Firstname',
                  icon: Icon(Icons.face),
                ),
                textInputAction: TextInputAction.next,
                controller: fNameController,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter Lastname',
                  labelText: 'Lastname',
                  icon: Icon(Icons.face),
                ),
                textInputAction: TextInputAction.next,
                controller: lNameController,
              ),
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
                onPressed: () => doRegister(context),
                child: Text(
                  'Register',
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
