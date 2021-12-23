import 'package:auto_route/auto_route.dart';
import 'package:bot_2000/core/auto_route/route_const.dart';
import 'package:bot_2000/core/extra_methods/print_message.dart';
import 'package:bot_2000/core/view_model/view_model.dart';
import 'package:bot_2000/view/components/strings/strings.dart';
import 'package:bot_2000/view/widgets/login_card.dart';
import 'package:bot_2000/view/widgets/my_text_field.dart';
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
        child: SingleChildScrollView(child: form(context)),
      ),
    );
  }

  _loginFunction() async {
    if (_formKey.currentState!.validate()) {
      final _viewModel = Provider.of<ViewModel>(context, listen: false);
      _viewModel
          .logIn(mail: _mail.text, password: _password.text)
          .then((value) async {
        if (value != null) {
          await _viewModel.getCurrentUser().then((value) {
            context.router.replaceNamed(RouteConsts.HOME_PAGE);
          });
        } else {
          PrintMessage.showFailed(context);
        }
      });
    }
  }

  void _registerPage() {
    context.router.navigateNamed(RouteConsts.REGISTER_PAGE);
  }

  Form form(BuildContext context) {
    return Form(
      key: _formKey,
      child: LoginCard(
        widget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            logoTitle(context),
            const Divider(
              color: Colors.transparent,
            ),
            MyTextField(
                controller: _mail,
                labelText: ConstTexts.mail,
                icon: Icons.person),
            MyTextField(
                controller: _password,
                labelText: ConstTexts.password,
                obscureText: true,
                icon: Icons.lock),
            ElevatedButton(
                onPressed: () {
                  _loginFunction();
                },
                child: Text(ConstTexts.submit)),
            const Divider(
              color: Colors.transparent,
            ),
            ElevatedButton(
                onPressed: () {
                  _registerPage();
                },
                child: Text(ConstTexts.register)),
          ],
        ),
      ),
    );
  }

  Wrap logoTitle(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      children: [
        const FlutterLogo(
          size: 75,
        ),
        Text(
          ConstTexts.title,
          style: Theme.of(context).textTheme.headline2!.copyWith(
                decoration: TextDecoration.lineThrough,
              ),
          maxLines: 2,
        ),
      ],
    );
  }
}
