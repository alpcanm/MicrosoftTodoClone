import 'package:flutter/material.dart';

import 'package:bot_2000/view/components/strings/strings.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.obscureText,
    this.icon,
    this.isNotRequired,
  }) : super(key: key);
  final TextEditingController controller;
  final String labelText;
  final bool? obscureText;
  final IconData? icon;
  final bool? isNotRequired;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextFormField(
        obscureText: obscureText ?? false,
        controller: controller,
        validator: isNotRequired == null
            ? (a) {
                if (a != null && a.length >= 6) {
                  return null;
                } else {
                  return ConstTexts.errorMessage;
                }
              }
            : null,
        decoration: InputDecoration(
          icon: icon != null ? Icon(icon) : null,
          label: Text(labelText),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
