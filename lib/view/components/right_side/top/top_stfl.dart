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
    return ListView.builder(
      itemCount: _notes.length,
      itemBuilder: (context, index) {
        return Text(_notes[index]!.text!);
      },
    );
  }
}
