import 'package:bot_2000/core/keys.dart';
import 'package:bot_2000/core/view_model/view_note_methods.dart';
import 'package:flutter/material.dart';

import 'package:bot_2000/core/models/notes/note.dart';

class CardStar extends StatelessWidget {
  const CardStar({
    Key? key,
    required this.note,
  }) : super(key: key);
  final Note note;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
        iconSize: 20,
        icon: _isMajorIconCheck(note.isMajor!, context),
        onPressed: () => _noteMajorButton(note.isMajor!),
        splashRadius: 20,
      ),
    );
  }

  Icon _isMajorIconCheck(bool isMajor, BuildContext context) {
    return isMajor
        ? Icon(Icons.star, color: Theme.of(context).colorScheme.secondary)
        : const Icon(Icons.star_border_outlined);
  }

  void _noteMajorButton(bool isMajor) {
    final _noteMethods = ViewNoteMethods();
    _noteMethods.updateField(
        tableName: Keys.tableNotes,
        value: !isMajor,
        columnName: Keys.columnIsMajor,
        relationId: note.noteId!);
  }
}
