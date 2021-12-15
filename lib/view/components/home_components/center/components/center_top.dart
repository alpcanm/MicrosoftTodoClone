
import 'package:bot_2000/view/components/home_components/center/components/note_button.dart';
import 'package:flutter/material.dart';
import 'package:bot_2000/core/models/notes/note.dart';

class NoteTable extends StatelessWidget {
  const NoteTable({
    Key? key,
    required this.notes,
  }) : super(key: key);
  final List<Note?> notes;

  @override
  Widget build(BuildContext context) {
    List<Note?> _notes = notes;
    if (_notes.isNotEmpty) {
      return Container(
        margin: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
              itemCount: _notes.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return NoteButton(
                  note: _notes[index]!,
                );
              },
            ),
          ],
        ),
      );
    } else {
      return Center(
          child: Text(
        'Veri Yok',
        style: Theme.of(context).textTheme.subtitle1,
      ));
    }
  }
}
