import 'package:bot_2000/view/components/center/top/components/note_bar.dart';
import 'package:flutter/material.dart';

import 'package:bot_2000/core/models/notes/note.dart';

class RightTable extends StatefulWidget {
  const RightTable({
    Key? key,
    required this.notes,
  }) : super(key: key);
  final List<Note?> notes;
  @override
  _RightTableState createState() => _RightTableState();
}

class _RightTableState extends State<RightTable> {
  @override
  Widget build(BuildContext context) {
    List<Note?> _notes = widget.notes;
    if (_notes.isNotEmpty) {
      return Container(
        margin: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
        child: ListView.builder(
          itemCount: _notes.length,
          itemBuilder: (context, index) {
            return NoteBar(
              note: _notes[index]!,
            );
          },
        ),
      );
    } else {
      return Center(
          child: Text(
        "Veri Yok",
        style: Theme.of(context).textTheme.subtitle1,
      ));
    }
  }
}
