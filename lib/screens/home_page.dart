import 'package:flutter/material.dart';
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
    MyGrid(
        id: 6,
        title: 'Data Fetch',
        myIcon: Icons.download,
        route: MyRoutes.toDataFetch),
    MyGrid(
        id: 7,
        title: 'Tic Tac Toe',
        myIcon: Icons.gamepad,
        route: MyRoutes.toTicTacToe),
    MyGrid(
        id: 8,
        title: 'Shared Pref Demo',
        myIcon: Icons.save,
        route: MyRoutes.toSharedPrefDemo),
    MyGrid(
        id: 9, title: 'Flat', myIcon: Icons.house, route: MyRoutes.toFetchFlat),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo'),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: GridView.count(
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        crossAxisCount: 3,
        childAspectRatio: 8 / 7,
        padding: EdgeInsets.all(10),
        children: List.from(gridItems),
      ),
    );
  }
}
