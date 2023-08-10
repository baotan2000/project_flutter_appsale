import 'package:flutter/material.dart';
import 'package:project_appsale/page/home/widget/home.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: HomePage.routerName,
    routes: {
      HomePage.routerName: (context) => HomePage(),
    },
    // home: MyApp(),
  ));
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(child: Container()),
//     );
//   }
// }
