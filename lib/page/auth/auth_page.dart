import 'package:flutter/material.dart';
import 'package:project_appsale/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatefulWidget {
  static const routerName = '/auth';
  AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isObscure = true;
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void handleSubmit() {
      final email = _emailController.text;
      final password = _passwordController.text;

      if (email.isNotEmpty && password.isNotEmpty) {
        //check user
        Provider.of<AuthProvider>(context, listen: false)
            .login(email, password);
      }
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text("Login")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(label: Text("Email")),
                ),
                const SizedBox(height: 10),
                TextField(
                  obscureText: _isObscure,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    label: const Text("Password"),
                    suffixIcon: IconButton(
                        icon: Icon(_isObscure
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        }),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  // height: 50,
                  child: ElevatedButton(
                    onPressed: handleSubmit,
                    child: const Text("Submit"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
