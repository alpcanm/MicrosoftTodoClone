import 'package:flutter/material.dart';

class SideButton {
  static Widget button(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(
            Icons.ac_unit,
            size: 24,
          ),
          label: Text(title)),
    );
  }
}
