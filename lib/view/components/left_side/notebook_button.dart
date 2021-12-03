import 'package:flutter/material.dart';

class NoteBookButton extends StatefulWidget {
  const NoteBookButton({
    Key? key,
    required this.title,
    this.iconData,
    required this.subTitle,
  }) : super(key: key);
  final String title;
  final String? iconData;
  final String subTitle;
  @override
  _NoteBookButtonState createState() => _NoteBookButtonState();
}

class _NoteBookButtonState extends State<NoteBookButton> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.accessibility_rounded),
      title: Text(widget.title),
      subtitle: Text(widget.subTitle),
    );
  }
}
