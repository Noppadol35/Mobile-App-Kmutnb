// http

import 'dart:convert';
import 'package:ev_charge_car/models/product.dart';
import 'package:http/http.dart' as http;

class HttpService {
  Future<List<Product>> fetchData({required String strUrl}) async {
    final response = await http.get(Uri.parse(strUrl), headers: {
      "Accept": "application/json",
      "content-type": "application/json",
    });

    if (response.statusCode == 200) {
      List data = json.decode(response.body); // ok
      return data
          .map((e) => Product.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load data!');
    }
  }

  // fetch 1 record
  Future<Product> fetchRecord({required String strUrl}) async {
    //debugPrint('url: $strUrl');
    final response = await http.get(Uri.parse(strUrl), headers: {
      "Accept": "application/json",
      "content-type": "application/json",
    });

    if (response.statusCode == 200) {
      //debugPrint('${response.body.toString()}');
      return Product.fromJson(jsonDecode(response.body));
    } else {
      //debugPrint('failed loading data!');
      throw Exception('Failed to load data!');
    }
  }
}
