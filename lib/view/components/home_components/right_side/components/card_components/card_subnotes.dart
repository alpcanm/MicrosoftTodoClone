import 'package:bot_2000/core/keys.dart';
import 'package:bot_2000/core/models/notes/sub_note.dart';
import 'package:bot_2000/core/view_model/view_note_methods.dart';
import 'package:bot_2000/view/widgets/text_and_field.dart';
import 'package:flutter/material.dart';

import 'package:bot_2000/core/models/notes/note.dart';

class CardSubnotes extends StatelessWidget {
  const CardSubnotes({
    Key? key,
    required this.note,
  }) : super(key: key);
  final Note note;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: note.subNotes?.length ?? 0,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            subNote(index, context),
            const Divider(
              height: 0,
              indent: 15,
              endIndent: 15,
            ),
          ],
        );
      },
    );
  }

  ListTile subNote(int index, BuildContext context) {
    SubNote _subnote = note.subNotes![index]!;
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: IconButton(
        onPressed: () =>
            _completeButton(_subnote.isComplete!, _subnote.subNoteId!),
        icon: _isCompleteIconCheck(_subnote.isComplete!, context),
        splashRadius: 12,
      ),
      title: TextAndField(
        text: _subnote.text ?? "",
        columnName: Keys.columnText,
        relationId: _subnote.subNoteId ?? "",
        tableName: Keys.tableSubnotes,
        textStyle: _textStyleCheck(_subnote.isComplete!, context),
      ),
    );
  }

  Icon _isCompleteIconCheck(bool isComplete, BuildContext context) {
    return isComplete
        ? Icon(Icons.check_circle_outlined,
            color: Theme.of(context).colorScheme.secondary)
        : const Icon(
            Icons.circle_outlined,
          );
  }

  TextStyle _textStyleCheck(bool isComplete, BuildContext context) {
    return isComplete
        ? Theme.of(context).textTheme.bodyText1!.copyWith(
            decoration: TextDecoration.lineThrough, color: Colors.grey)
        : Theme.of(context).textTheme.bodyText1!;
  }

  void _completeButton(bool isComplete, String subnoteId) {
    final _noteMethods = ViewNoteMethods();
    _noteMethods.updateField(
        tableName: Keys.tableSubnotes,
        value: !isComplete,
        columnName: Keys.columnIsComplete,
        relationId: subnoteId);
  }
}
