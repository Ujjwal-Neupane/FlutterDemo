import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:flutter_learn_demo/models/flat_model.dart';
import 'package:flutter_learn_demo/utils/my_urls.dart';
import 'package:http/http.dart' as http;

class FlatService {
  dynamic fetchFlatList() async {
    final response = await http.get(Uri.parse(MyUrls.realEstateFlat));

    if (response.statusCode == 200) {
      var flatData = jsonDecode(response.body);
      log(flatData.toString());
      List<Flat> flatList =
          List.from(flatData).map<Flat>((item) => Flat.fromMap(item)).toList();
      List imageList = [];

      Map<String, dynamic> flatMap = {
        'flatList': flatList,
      };
      return flatMap;
    } else {
      print('error...');
      return null;
    }
  }

  addFlat(Flat flat) async {
    final imageByte = await rootBundle.load('assets/images/login.png');
    var buffer = imageByte.buffer;
    String image64 = base64Encode(Uint8List.view(buffer));

    Map<String, dynamic> map = flat.toMap();
    map['image_size'] = '1';
    map['encoded_image_0'] = image64;
    map['user_id'] = '20';

    final response = await http.post(
      Uri.parse(MyUrls.rootUrl + '/real_estate/insert_flat.php'),
      body: map,
      encoding: Encoding.getByName('utf-8'),
    );
    print('Status code ${response.statusCode}');
  }
}
