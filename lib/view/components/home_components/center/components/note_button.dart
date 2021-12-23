import 'dart:html';

import 'package:bot_2000/core/keys.dart';
import 'package:bot_2000/core/view_model/note_viewmodel.dart';
import 'package:bot_2000/core/view_model/view_note_methods.dart';
import 'package:bot_2000/core/view_model/window_state.dart';
import 'package:flutter/material.dart';
import 'package:bot_2000/core/models/notes/note.dart';
import 'package:provider/provider.dart';

class NoteButton extends StatefulWidget {
  const NoteButton({
    Key? key,
    required this.note,
  }) : super(key: key);
  final Note note;
  @override
  _NoteButtonState createState() => _NoteButtonState();
}

class _NoteButtonState extends State<NoteButton> {
  @override
  Widget build(BuildContext context) {
    Note _note = widget.note;
    return Card(
      color: Theme.of(context).cardColor,
      child: InkWell(
        child: ListTile(
          leading: IconButton(
            onPressed: () => _noteCompleteButton(widget.note.isComplete!),
            icon: _isCompleteIconCheck(widget.note.isComplete!),
            splashRadius: 12,
          ),
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              _note.text!,
              style: _textStyleCheck(widget.note.isComplete!),
            ),
          ),
          trailing: IconButton(
              onPressed: () => _noteMajorButton(_note.isMajor!),
              icon: _isMajorIconCheck(_note.isMajor!)),
        ),
        onTap: () {
          final _noteViewModel =
              Provider.of<NoteViewModel>(context, listen: false);
          final _windowState = Provider.of<WindowState>(context, listen: false);
          _windowState.secondWindowOpen = true;
          _noteViewModel.currentNote = _note;
        },
      ),
    );
  }

  TextStyle _textStyleCheck(bool isComplete) {
    return isComplete
        ? Theme.of(context).textTheme.bodyText1!.copyWith(
            decoration: TextDecoration.lineThrough, color: Colors.grey)
        : Theme.of(context).textTheme.bodyText1!;
  }

  Icon _isCompleteIconCheck(bool isComplete) {
    return isComplete
        ? Icon(Icons.check_circle_outlined,
            color: Theme.of(context).colorScheme.secondary)
        : const Icon(
            Icons.circle_outlined,
          );
  }

  void _noteCompleteButton(bool isComplete) {
    final _noteMethods = ViewNoteMethods();
    _noteMethods.updateField(
        tableName: Keys.tableNotes,
        value: !isComplete,
        columnName: Keys.columnIsComplete,
        relationId: widget.note.noteId!);
  }

  void _noteMajorButton(bool isMajor) {
    final _noteMethods = ViewNoteMethods();
    _noteMethods.updateField(
        tableName: Keys.tableNotes,
        value: !isMajor,
        columnName: Keys.columnIsMajor,
        relationId: widget.note.noteId!);
  }

  _isMajorIconCheck(bool isMajor) {
    return isMajor
        ? Icon(Icons.star, color: Theme.of(context).colorScheme.secondary)
        : const Icon(Icons.star_border_outlined);
  }
}
