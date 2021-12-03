import 'package:bot_2000/core/models/user.dart';
import 'package:bot_2000/core/view_model/user_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileBar {
  static Widget bar(BuildContext context) {
    final _userVM = Provider.of<UserVM>(context);
    User? _user = _userVM.user;

    if (_user != null) {
      return ListTile(
        title: Text(_user.name!),
        leading: const CircleAvatar(
          child: FlutterLogo(),
        ),
        subtitle: Text(_user.mail!),
      );
    } else {
      return const SizedBox();
    }
  }
}
