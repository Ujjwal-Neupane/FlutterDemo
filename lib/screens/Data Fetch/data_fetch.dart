import 'package:flutter/material.dart';
import 'package:flutter_learn_demo/screens/Data%20Fetch/user_detail_page.dart';
import 'package:flutter_learn_demo/services/user_services.dart';

import '../../models/user_detail.dart';

class DataFetch extends StatefulWidget {
  const DataFetch({Key? key}) : super(key: key);

  @override
  _DataFetchState createState() => _DataFetchState();
}

class _DataFetchState extends State<DataFetch> {
  List<User> userList = [];
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getUserList();
  }

  Future<void> getUserList() async {
    UserServices userServices = UserServices();
    userList = await userServices.fetchUser();
    print(userList);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch Data Demo'),
      ),
      body: (userList.isEmpty)
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: userList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () => gotoUserDetail(userList[index]),
                  leading: Text(userList[index].username),
                );
              },
            ),
    );
  }

  gotoUserDetail(User user) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => UserDetail(
                  user: user,
                )));
  }
}
