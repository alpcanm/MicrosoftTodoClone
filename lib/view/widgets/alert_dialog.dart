import 'package:flutter/material.dart';
import 'package:bot_2000/view/components/strings/strings.dart';

class MyAlertDialog {
  static Future<void> showMyDialog(
      {required BuildContext context,
      required VoidCallback onApprove,
      required String text}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return MyAlertDialogWidget(onApprove: onApprove, text: text);
      },
    );
  }
}

class MyAlertDialogWidget extends StatelessWidget {
  const MyAlertDialogWidget({
    Key? key,
    required this.onApprove,
    required this.text,
  }) : super(key: key);
  final VoidCallback onApprove;
  final String text;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(ConstTexts.alertTitle),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(ConstTexts.alertText(text)),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(ConstTexts.onayla),
          onPressed: () {
            onApprove.call();
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text(ConstTexts.iptal),
          onPressed: () {
            onApprove.call();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
