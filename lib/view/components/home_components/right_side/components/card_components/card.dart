import 'package:bot_2000/core/keys.dart';
import 'package:bot_2000/view/components/home_components/right_side/components/card_components/card_star.dart';
import 'package:bot_2000/view/components/home_components/right_side/components/card_components/card_subnotes.dart';
import 'package:bot_2000/view/widgets/text_and_field.dart';
import 'package:flutter/material.dart';
import 'package:bot_2000/core/models/notes/note.dart';

class RightCard extends StatelessWidget {
  const RightCard({
    Key? key,
    required this.note,
  }) : super(key: key);
  final Note note;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CardStar(
          note: note,
        ),
        Column(
          children: [
            TextAndField(
              text: note.text!,
              textStyle: Theme.of(context).textTheme.headline5!,
              columnName: Keys.columnText,
              relationId: note.noteId!,
              tableName: Keys.tableNotes,
            ),
            const Divider(
              color: Colors.transparent,
            ),
            TextAndField(
                text: note.comment!,
                columnName: Keys.columnComment,
                tableName: Keys.tableNotes,
                relationId: note.noteId!,
                textStyle: Theme.of(context).textTheme.bodyText2!),
            CardSubnotes(note: note),
            const Divider(
              color: Colors.transparent,
            ),
          ],
        ),
      ],
    );
  }
}
