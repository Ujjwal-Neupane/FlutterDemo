import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn_demo/screens/Async%20Await/async_await_demo.dart';
import 'package:flutter_learn_demo/screens/Authenticate/Auth%20Screen/auth_container.dart';
import 'package:flutter_learn_demo/screens/Authenticate/auth_user.dart';
import 'package:flutter_learn_demo/screens/Authenticate/auth_wrapper.dart';
import 'package:flutter_learn_demo/screens/Firebase_Data/firebase_products.dart';
import 'package:flutter_learn_demo/screens/Navigator/first_screen.dart';
import 'package:flutter_learn_demo/screens/Tab%20View/tab_container.dart';
import 'package:flutter_learn_demo/screens/home_page.dart';
import 'package:flutter_learn_demo/screens/Login%20UI/login_page.dart';
import 'package:flutter_learn_demo/utils/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      routes: {
        '/loginPage': (context) => LoginPage(),
        '/homePage': (context) => HomePage(),
        MyRoutes.toTabContainer: (context) => TabContainer(),
        MyRoutes.toAuthContainer: (context) => AuthContainer(),
        MyRoutes.toAuthUser: (context) => AuthUser(),
        MyRoutes.toAsyncAwaitDemo: (context) => AsyncAwaitDemo(),
        MyRoutes.toAuthWrapper: (context) => AuthWrapper(),
        MyRoutes.toNavigatorDemo: (context) => FirstScreen(),
        MyRoutes.toFirebaseProducts: (context) => FirebaseProducts()
      },
      home: Scaffold(
        body: HomePage(),
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
