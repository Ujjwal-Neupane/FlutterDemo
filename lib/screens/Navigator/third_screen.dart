import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton(onPressed: () => goBack(), child: Text('Go back')),
    ));
  }

  goBack() {}
  goToFirst() {}
}
