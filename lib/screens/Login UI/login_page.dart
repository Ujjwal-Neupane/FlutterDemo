import 'package:flutter/material.dart';
import 'package:flutter_learn_demo/utils/routes.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  showSnackBar(String msg, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      duration: Duration(milliseconds: 500),
    ));
  }

  gotoHome(BuildContext context) {
    Navigator.pushNamed(context, MyRoutes.toHomePage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/login.png',
                  height: 200,
                ),
                SizedBox(height: 20),
                Text(
                  'Welcome',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700]),
                ),
                TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Enter Username',
                        labelText: 'Username',
                        icon: Icon(Icons.face)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter username";
                      }
                    }),
                TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Enter Password',
                        labelText: 'Password',
                        icon: Icon(Icons.lock)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter password";
                      }
                    }),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showSnackBar('Login', context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(180, 40), primary: Colors.green),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 34,
                ),
                Text(
                  'Don\'t have an account?',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                SizedBox(
                  height: 6,
                ),
                InkWell(
                  onTap: () => showSnackBar('Sign Up', context),
                  child: Text(
                    'SIGN UP NOW',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green[700],
                        fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
