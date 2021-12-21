import 'package:flutter/material.dart';

class PrintMessage {
  static ScaffoldFeatureController showFailed(BuildContext context) {
    const _failed = SnackBar(content: Text('Bir şeyler ters gitti.'));
    return ScaffoldMessenger.of(context).showSnackBar(_failed);
  }

  static ScaffoldFeatureController showSucces(BuildContext context) {
    const _succes = SnackBar(content: Text('İşlem Başarılı'));
    return ScaffoldMessenger.of(context).showSnackBar(_succes);
  }
}
