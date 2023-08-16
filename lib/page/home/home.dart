import 'package:flutter/material.dart';
import 'package:project_appsale/const.dart';
import 'package:project_appsale/page/auth/auth_page.dart';
import 'package:project_appsale/page/cart/cart.dart';
import 'package:project_appsale/page/home/widget/home_category.dart';
import 'package:project_appsale/page/home/widget/home_slider.dart';
import 'package:project_appsale/page/home/widget/list_product_special.dart';
import 'package:project_appsale/providers/auth_provider.dart';
import 'package:project_appsale/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static const routerName = '/';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, auth, child) {
        return auth.isAuth
            ? const Home()
            : FutureBuilder(
                future: auth.autoLogin(),
                initialData: false,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return snapshot.data ? const Home() : AuthPage();
                },
              );
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
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 17, right: 10),
            child: Consumer<CartProvider>(
              builder: (context, value, child) {
                return Badge(
                  label: Text('${value.items.length}'),
                  child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, CartPage.routerName);
                      },
                      child: Icon(Icons.shopping_cart)),
                );
              },
            ),
          ),
        ],
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
            height: 10,
          ),
          const HomeCategory(),
          SizedBox(height: 7),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Sản phẩm đặc biệt",
                  style: fdCategory,
                ),
                Text("Tất cả (4)"),
              ],
            ),
          ),
          SizedBox(height: 10),
          ListProductSpecial(),
        ],
      ),
    );
  }
}
