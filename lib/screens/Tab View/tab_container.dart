import 'package:flutter/material.dart';
import 'package:flutter_learn_demo/screens/Tab%20View/first_tab.dart';
import 'package:flutter_learn_demo/screens/Tab%20View/second_tab.dart';
import 'package:flutter_learn_demo/screens/Tab%20View/third_tab.dart';

class TabContainer extends StatelessWidget {
  const TabContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tab View Demo'),
          bottom: TabBar(
            tabs: const [
              Tab(icon: Icon(Icons.sports), text: 'First'),
              Tab(icon: Icon(Icons.dining), text: 'Second'),
              Tab(icon: Icon(Icons.local_drink_sharp), text: 'Third')
            ],
          ),
        ),
        body: TabBarView(
          children: const [FirstTab(), SecondTab(), ThirdTab()],
        ),
      ),
    );
  }
}
