import 'package:flutter/material.dart';
import 'package:flutter_learn_demo/screens/Navigator/first_screen.dart';
import 'package:flutter_learn_demo/screens/Navigator/third_screen.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Screen')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () => goToThirdScreen(context),
                child: Text('Go to third page')),
            ElevatedButton(
                onPressed: () => goBack(context), child: Text('Go back')),
          ],
        ),
      ),
    );
  }

  goToThirdScreen(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ThirdScreen(),
        ));
  }

//don't push to go back
//do pop and remove from stack
  goBack(context) {
    Navigator.pop(
        context,
        MaterialPageRoute(
          builder: (context) => FirstScreen(),
        ));
  }
}
