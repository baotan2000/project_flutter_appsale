import 'package:flutter/material.dart';
import 'package:project_appsale/page/auth/auth_page.dart';
import 'package:project_appsale/page/category/widget/category.dart';
import 'package:project_appsale/page/home/home.dart';
import 'package:project_appsale/page/product/widget/product.dart';
import 'package:project_appsale/providers/auth_provider.dart';
import 'package:project_appsale/providers/category_provider.dart';
import 'package:project_appsale/providers/slider_provider.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SliderProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CategoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
      ],
      child: Consumer<AuthProvider>(
        builder: (context, auth, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute:
                !auth.isAuth ? AuthPage.routerName : HomePage.routerName,
            routes: {
              HomePage.routerName: (context) => HomePage(),
              CategoryPage.routerName: (context) => CategoryPage(),
              ProductPage.routerName: (context) => ProductPage(),
              AuthPage.routerName: (context) => AuthPage(),
            },
            // home: MyApp(),
          );
        },
      ),
    ),
  );
}
