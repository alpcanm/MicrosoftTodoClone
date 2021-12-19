import 'package:bot_2000/core/view_model/view_model.dart';
import 'package:bot_2000/view/components/strings/strings.dart';
import 'package:bot_2000/view/widgets/login_card.dart';
import 'package:bot_2000/view/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _surname = TextEditingController();
  final TextEditingController _mail = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _rePassword = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final mySnackBar = const SnackBar(content: Text('İşlem Başarılı'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ConstTexts.register),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Form(
            key: _formKey,
            child: LoginCard(
              widget: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyTextField(controller: _name, labelText: ConstTexts.name),
                  MyTextField(
                      controller: _surname, labelText: ConstTexts.surname),
                  MyTextField(controller: _mail, labelText: ConstTexts.mail),
                  MyTextField(
                    controller: _phoneNumber,
                    labelText: ConstTexts.phoneNumber,
                    isNotRequired: true,
                  ),
                  MyTextField(
                      controller: _password, labelText: ConstTexts.password),
                  MyTextField(
                      controller: _rePassword, labelText: ConstTexts.password),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _registerFunction().then((value) =>
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(mySnackBar));
                        }
                      },
                      child: Text(ConstTexts.register))
                ],
              ),
            )),
      ),
    );
  }

  Future<bool> _registerFunction() async {
    final _viewModel = Provider.of<ViewModel>(context, listen: false);
    return await _viewModel.registerUser(
        name: _name.text,
        surname: _surname.text,
        mail: _mail.text,
        password: _password.text,
        phoneNumber: _phoneNumber.text);
  }
}
