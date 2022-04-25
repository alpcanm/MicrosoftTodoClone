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
    List<Note?> _isCompleteFalse = notes
        .where((element) => (element?.isComplete == false) ? true : false)
        .toList();
    List<Note?> _isCompleteTrue = notes
        .where((element) => (element?.isComplete == true) ? true : false)
        .toList();

    if (_isCompleteFalse.isNotEmpty || _isCompleteTrue.isNotEmpty) {
      return Container(
        margin: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
        child: ListView(
          children: [
            ListView.builder(
              itemCount: _isCompleteFalse.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return NoteButton(
                  note: _isCompleteFalse[index] ?? Note(),
                );
              },
            ),
            _isCompleteTrue.isEmpty
                ? const SizedBox()
                : _divider(_isCompleteTrue.length),
            ListView.builder(
              itemCount: _isCompleteTrue.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return NoteButton(
                  note: _isCompleteTrue[index] ?? Note(),
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

  Widget _divider(int completeLength) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text('Tamamlandı ${completeLength.toString()}'),
    ));
  }
}
