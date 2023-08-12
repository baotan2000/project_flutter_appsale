import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  static const routerName = '/auth';
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text("Login")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(label: Text("Email")),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(label: Text("Password")),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                // height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
