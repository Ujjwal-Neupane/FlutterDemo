import 'dart:convert';
import 'package:flutter_learn_demo/utils/my_urls.dart';
import 'package:http/http.dart' as http;

import '../models/user_detail.dart';

class UserServices {
  Future<dynamic> fetchUser() async {
    final response = await http.get(Uri.parse(MyUrls.userJson));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var userData = jsonDecode(response.body);
      return List.from(userData)
          .map<User>((item) => User.fromJson(item))
          .toList();
      // return User.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load user');
    }
  }
}
