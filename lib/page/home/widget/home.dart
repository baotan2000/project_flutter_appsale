import 'package:flutter/material.dart';
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
        ],
      ),
    );
  }
}
