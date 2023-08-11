import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_appsale/models/category_model.dart';
import 'package:project_appsale/models/product_model.dart';

class CategoryProvider extends ChangeNotifier {
  Future<List<Category>> getCatgory() async {
    const url = 'http://apiforlearning.zendvn.com/api/mobile/categories';
    try {
      final response = await http.get(Uri.parse(url));
      final jsonData = jsonDecode(response.body);
      // print(jsonData);
      List<Category> data = List<Category>.from(
          jsonData.map((cate) => Category.fromJson(jsonEncode(cate)))).toList();
      return data;
    } catch (e) {
      return Future.error(
        Exception("No Data"),
      );
    }
  }

  Future<List<Product>> getProductCatgory(int id) async {
    final url =
        'http://apiforlearning.zendvn.com/api/mobile/categories/$id/products';
    final uri = Uri.parse(url);
    final finalUri = uri.replace(queryParameters: {});
    try {
      final response = await http.get(finalUri);
      final jsonData = jsonDecode(response.body);
      // print(jsonData);
      List<Product> data = List<Product>.from(
              jsonData.map((product) => Product.fromJson(jsonEncode(product))))
          .toList();
      return data;
    } catch (e) {
      return Future.error(
        Exception("No Data"),
      );
    }
  }
}
