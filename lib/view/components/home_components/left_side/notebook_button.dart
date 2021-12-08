import 'package:flutter/material.dart';


class NoteBookButton extends StatelessWidget {
  const NoteBookButton({
    Key? key,
    required this.title,
    this.iconData,
    this.subTitle,
    required this.noteBookId,
    required this.onPress,
  }) : super(key: key);
  final String title;
  final String? iconData;
  final String? subTitle;
  final String noteBookId;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
        leading: const Icon(Icons.note),
        title: Row(
          children: [
            Expanded(
                flex: 13,
                child: Text(
                 title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                )),
            Expanded(flex: 2, child: Text(subTitle ?? ''))
          ],
        ),
      ),
      onTap: onPress.call,
    );
  }
}
