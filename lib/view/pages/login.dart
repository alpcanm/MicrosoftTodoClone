import 'package:auto_route/auto_route.dart';
import 'package:bot_2000/core/auto_route/route_const.dart';
import 'package:bot_2000/core/view_model/view_model.dart';
import 'package:bot_2000/view/components/strings/strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _mail = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: form(context),
      ),
    );
  }

  _loginFunction() async {
    if (_formKey.currentState!.validate()) {
      final _viewModel = Provider.of<ViewModel>(context, listen: false);
      _viewModel
          .logIn(mail: _mail.text, password: "password")
          .then((value) async {
        if (value) {
          await _viewModel.getCurrentUser().then((value) {
            context.router.navigateNamed(RouteConsts.HOME_PAGE);
          });
        } else {
          print("yanlış şifre");
        }
      });
    }
  }

  Form form(BuildContext context) {
    return Form(
      key: _formKey,
      child: SizedBox(
        width: 600,
        height: 400,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check_circle_outlined,
                      color: Theme.of(context).colorScheme.secondary,
                      size: 72,
                    ),
                    Text(
                      ConstTexts.title,
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            decoration: TextDecoration.lineThrough,
                          ),
                    )
                  ],
                ),
                const Divider(
                  color: Colors.transparent,
                ),
                TextFormField(
                  decoration: _mailInputDecoration(),
                  controller: _mail,
                ),
                const Divider(
                  color: Colors.transparent,
                ),
                TextFormField(
                    decoration: _passwordInputDecoration(),
                    controller: _password,
                    validator: (a) {
                      if (a != null && a.length >= 6) {
                        return null;
                      } else {
                        return ConstTexts.passwordErrorMessage;
                      }
                    },
                    obscureText: true),
                const Divider(
                  color: Colors.transparent,
                ),
                ElevatedButton(
                    onPressed: () {
                      _loginFunction();
                    },
                    child: Text(ConstTexts.submit)),
                const Divider(
                  color: Colors.transparent,
                ),
                ElevatedButton(
                    onPressed: () {}, child: Text(ConstTexts.register)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _mailInputDecoration() {
    return InputDecoration(
      icon: const Icon(Icons.person),
      label: Text(ConstTexts.userName),
      border: const OutlineInputBorder(),
    );
  }

  InputDecoration _passwordInputDecoration() {
    return InputDecoration(
      icon: const Icon(Icons.lock),
      label: Text(ConstTexts.password),
      border: const OutlineInputBorder(),
    );
  }
}
