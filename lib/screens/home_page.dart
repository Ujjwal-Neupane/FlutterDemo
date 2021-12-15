import 'package:flutter/material.dart';
import 'package:flutter_learn_demo/screens/Firebase_Data/firebase_products.dart';
import 'package:flutter_learn_demo/utils/routes.dart';
import 'package:flutter_learn_demo/widgets/drawer.dart';
import 'package:flutter_learn_demo/widgets/my_grid.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<MyGrid> gridItems = [
    MyGrid(
        id: 1,
        title: 'Login Page',
        myIcon: Icons.unsubscribe_rounded,
        route: MyRoutes.toLoginPage),
    MyGrid(
        id: 2,
        title: 'Tab View',
        myIcon: Icons.unsubscribe_rounded,
        route: MyRoutes.toTabContainer),
    MyGrid(
        id: 3,
        title: 'Firebase Auth',
        myIcon: Icons.unsubscribe_rounded,
        route: MyRoutes.toAuthWrapper),
    MyGrid(
        id: 4,
        title: 'Async Await Demo',
        myIcon: Icons.unsubscribe_rounded,
        route: MyRoutes.toAsyncAwaitDemo),
    MyGrid(
        id: 5,
        title: 'Navigator Demo',
        myIcon: Icons.unsubscribe_rounded,
        route: MyRoutes.toNavigatorDemo),
    MyGrid(
        id: 5,
        title: 'Firebase Data',
        myIcon: Icons.upload,
        route: MyRoutes.toFirebaseProducts),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo'),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          children: List.from(gridItems),
        ),
      ),
    );
  }
}
