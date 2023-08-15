// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CartItem {
  final int id;
  final String image;
  final String name;
  final int price;
  final int quantity;
  CartItem({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
  });
}

class CartProvider extends ChangeNotifier {
  Map<int, CartItem> items = {};

  void addCart(int productId, String image, String name, int price,
      [int quantity = 1]) {
    print(productId);
  }
}
