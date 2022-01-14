import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefDemo extends StatefulWidget {
  const SharedPrefDemo({Key? key}) : super(key: key);

  @override
  _SharedPrefDemoState createState() => _SharedPrefDemoState();
}

class _SharedPrefDemoState extends State<SharedPrefDemo> {
  bool loginStatus = false;
  int count = 0;
  SharedPreferences? pref;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initSharedPreferences();
  }

  Future<void> initSharedPreferences() async {
    pref = await SharedPreferences.getInstance();
    loginStatus = pref?.getBool('loginStatus') ??
        false; //if loginStatus is null(not created yet) then set value false
    count = pref?.getInt('count') ?? 0; //if count is null set value 0
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Login Status: ${getLoginStatus()}'),
            getLoginStatus()
                ? ElevatedButton(
                    onPressed: () => doLogout(), child: Text('Logout'))
                : ElevatedButton(
                    onPressed: () => doLogin(), child: Text('Login')),
            SizedBox(height: 20),
            Text(
              "$count",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            FloatingActionButton(
                onPressed: () => increaseCount(), child: Icon(Icons.add)),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () => clearPrefs(), child: Text('Clear Shared Pref'))
          ],
        ),
      ),
    );
  }

  doLogin() {
    setState(() {
      pref?.setBool('loginStatus', true);
    });
  }

  doLogout() {
    setState(() {
      pref?.setBool('loginStatus', false);
    });
  }

  bool getLoginStatus() {
    return pref?.getBool('loginStatus') ?? false;
  }

  increaseCount() {
    count++;
    pref?.setInt('count', count);
    setState(() {});
  }

  clearPrefs() {
    setState(() {
      pref?.remove('count');
      count = 0;
    });
  }
}
