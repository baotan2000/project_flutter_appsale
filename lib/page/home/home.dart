import 'package:flutter/material.dart';
import 'package:project_appsale/const.dart';
import 'package:project_appsale/page/home/widget/home_category.dart';
import 'package:project_appsale/page/home/widget/home_slider.dart';

class HomePage extends StatelessWidget {
  static const routerName = '/';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Column(
        children: [
          HomeSlider(),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Danh mục sản phẩm",
                  style: fdCategory,
                ),
                Text("Tất cả (4)"),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          const HomeCategory(),
        ],
      ),
    );
  }
}
