import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  static const routerName = '/category';
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arg =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: Text(arg["name"]),
      ),
    );
  }
}
