import 'package:bot_2000/core/models/user.dart';
import 'package:bot_2000/core/view_model/view_model.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileBar extends StatefulWidget {
  const ProfileBar({Key? key}) : super(key: key);

  @override
  _ProfileBarState createState() => _ProfileBarState();
}

class _ProfileBarState extends State<ProfileBar> {
  bool _switchState = false;
  @override
  Widget build(BuildContext context) {
    final _viewModel = Provider.of<ViewModel>(context);
    User? _user = _viewModel.user;

    if (_user != null) {
      return ListTile(
        title: Text(_user.name!),
        leading: const CircleAvatar(
          child: FlutterLogo(),
        ),
        subtitle: Text(_user.mail!),
        trailing: themeSwitch(_viewModel),
      );
    } else {
      return const SizedBox();
    }
  }

  Widget themeSwitch(ViewModel _viewModel) {
    return Switch(
        value: _switchState,
        onChanged: (value) {
          setState(() {
            _switchState = value;
          });
          if (!_switchState) {
            _viewModel.themeState = ThemeState.light;
          } else {
            _viewModel.themeState = ThemeState.dark;
          }
        });
  }
}
