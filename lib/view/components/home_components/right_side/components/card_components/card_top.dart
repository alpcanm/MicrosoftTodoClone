import 'package:bot_2000/core/keys.dart';
import 'package:bot_2000/view/widgets/text_and_field.dart';
import 'package:flutter/material.dart';
import 'package:bot_2000/core/models/notes/note.dart';

class CardTop extends StatelessWidget {
  const CardTop({
    Key? key,
    required this.note,
  }) : super(key: key);
  final Note note;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            iconSize: 20,
            icon: const Icon(Icons.star_border),
            onPressed: () {},
            splashRadius: 20,
          ),
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
            subNotes(),
            const Divider(
              color: Colors.transparent,
            ),
          ],
        ),
      ],
    );
  }

  Widget subNotes() {
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
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.circle_outlined,
        ),
        splashRadius: 12,
      ),
      title: TextAndField(
        text: note.subNotes?[index]?.text ?? "",
        columnName: Keys.columnText,
        relationId: note.subNotes?[index]!.subNoteId ?? "",
        tableName: Keys.tableSubnotes,
        textStyle: Theme.of(context).textTheme.subtitle2!,
      ),
    );
  }
}
