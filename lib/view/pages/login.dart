import 'package:bot_2000/core/navigation/navigation_const.dart';
import 'package:bot_2000/core/navigation/navigation_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Center(
        child: form(),
      ),
    );
  }

  Form form() {
    final TextEditingController _mail = TextEditingController();
    final TextEditingController _password = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Form(
      key: _formKey,
      child: SizedBox(
        width: 600,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: "Mail"),
              controller: _mail,
            ),
            TextFormField(
                decoration: const InputDecoration(labelText: "Password"),
                controller: _password,
                validator: (a) {
                  if (a != null && a.length >= 6) {
                    return null;
                  } else {
                    return "Password must be greater than 6";
                  }
                },
                obscureText: true),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    NavigationService.instance
                        .navigateToPage(path: NavigationConstants.home);
                  }
                },
                child: const Text("Submit")),
          ],
        ),
      ),
    );
  }
}
