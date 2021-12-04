import 'package:bot_2000/view/components/left_side/notebook_button.dart';
import 'package:flutter/material.dart';

import 'package:bot_2000/core/models/notes/note.dart';

class NoteBar extends StatefulWidget {
  const NoteBar({
    Key? key,
    required this.note,
  }) : super(key: key);
  final Note note;
  @override
  _NoteBarState createState() => _NoteBarState();
}

class _NoteBarState extends State<NoteBar> {
  @override
  Widget build(BuildContext context) {
    Note _note = widget.note;

    return Card(
      color: Theme.of(context).cardColor,
      child: InkWell(
        child: ListTile(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.circle_outlined,
            ),
            splashRadius: 12,
          ),
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              _note.text!,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
