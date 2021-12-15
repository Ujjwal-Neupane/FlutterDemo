import 'package:flutter/material.dart';
import 'package:flutter_learn_demo/screens/Navigator/second_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Screen')),
      body: Center(
        child: ElevatedButton(
            onPressed: () => goToSecondScreen(context),
            child: Text('Go to next page')),
      ),
    );
  }

  goToSecondScreen(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondScreen(),
        ));
  }
}
