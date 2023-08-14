import 'package:flutter/material.dart';
import 'package:project_appsale/const.dart';
import 'package:project_appsale/page/auth/auth_page.dart';
import 'package:project_appsale/page/home/widget/home_category.dart';
import 'package:project_appsale/page/home/widget/home_slider.dart';
import 'package:project_appsale/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static const routerName = '/';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, auth, child) {
        return !auth.isAuth ? AuthPage() : Home();
        // return !auth.isAuth ? Home() : AuthPage();
      },
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
              SizedBox(
                child: Image(
                  width: 200,
                  fit: BoxFit.contain,
                  image: AssetImage('assets/logo/flutter-logo-sharing.png'),
                ),
              ),
              SizedBox(
                height: 500,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.home),
                        title: Text("Home Page"),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: Icon(Icons.logout),
                        title: Text("Logout"),
                        onTap: () {
                          Provider.of<AuthProvider>(context, listen: false)
                              .logout();
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Center(child: Text("Home Page")),
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
