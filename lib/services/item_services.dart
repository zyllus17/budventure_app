import 'dart:convert';

import 'package:budventure_app/constants/url.dart';
import 'package:budventure_app/model/item_model.dart';
import 'package:http/http.dart' as http;

class ItemServices {
  Future<ItemModel> fetchItem() async {
    final response = await http.get(Uri.parse(AppUrl.baseUrl));

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return ItemModel.fromJson(json);
    } else {
      throw Exception('Data not fetched');
    }
  }
}
