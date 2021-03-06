import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn_demo/screens/Async%20Await/async_await_demo.dart';
import 'package:flutter_learn_demo/screens/Authenticate/Auth%20Screen/auth_container.dart';
import 'package:flutter_learn_demo/screens/Authenticate/auth_user.dart';
import 'package:flutter_learn_demo/screens/Authenticate/auth_wrapper.dart';
import 'package:flutter_learn_demo/screens/Data%20Fetch/data_fetch.dart';
import 'package:flutter_learn_demo/screens/Firebase_Data/firebase_products.dart';
import 'package:flutter_learn_demo/screens/Navigator/first_screen.dart';
import 'package:flutter_learn_demo/screens/Push%20Notification/push_notification.dart';
import 'package:flutter_learn_demo/screens/Rent%20Flat/fetch_flat.dart';
import 'package:flutter_learn_demo/screens/Shared%20Pref/shared_pref.dart';
import 'package:flutter_learn_demo/screens/Tab%20View/tab_container.dart';
import 'package:flutter_learn_demo/screens/Tic%20Tac%20Toe/tic_tac_toe.dart';
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
        MyRoutes.toFirebaseProducts: (context) => FirebaseProducts(),
        MyRoutes.toDataFetch: (context) => DataFetch(),
        MyRoutes.toTicTacToe: (context) => TicTacToe(),
        MyRoutes.toSharedPrefDemo: (context) => SharedPrefDemo(),
        MyRoutes.toFetchFlat: (context) => FetchFlat(),
        MyRoutes.toPushNotification: (context) => PushNotiDemo(),
      },
      home: Scaffold(
        body: HomePage(),
      ),
      debugShowCheckedModeBanner: false,

      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
