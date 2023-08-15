import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:project_appsale/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductProvider extends ChangeNotifier {
  List<Product> productSpecial = [];

  Future<List<Product>> getProductSpecial() async {
    const url =
        'http://apiforlearning.zendvn.com/api/mobile/products?offset=0&sortBy=id&order=asc&special=true';
    final uri = Uri.parse(url);
    try {
      final response = await http.get(Uri.parse(url));
      final jsonData = jsonDecode(response.body);
      // print(jsonData);
      List<Product> data = List<Product>.from(
              jsonData.map((product) => Product.fromJson(jsonEncode(product))))
          .toList();
      productSpecial = data;
      return data;
    } catch (e) {
      return Future.error(
        Exception("No Data"),
      );
    }
  }
}
