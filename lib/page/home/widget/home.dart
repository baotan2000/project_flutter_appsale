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
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 80,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 10),
              scrollDirection: Axis.horizontal,
              itemCount: 14,
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 10,
                );
              },
              itemBuilder: (context, index) {
                return Container(
                  width: 80,
                  color: Colors.amber,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
