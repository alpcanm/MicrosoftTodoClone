import 'package:flutter/material.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({
    Key? key,
    required this.widget,
  }) : super(key: key);
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 600,
        height: 600,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: widget,
          ),
        ));
  }
}
