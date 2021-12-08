import 'package:flutter/material.dart';

import 'package:bot_2000/core/models/notes/note.dart';

class CardTop extends StatelessWidget {
  const CardTop({
    Key? key,
    this.note,
  }) : super(key: key);
  final Note? note;
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
            Text(
              note?.text ?? '',
              style: Theme.of(context).textTheme.headline2,
            ),
            const Divider(
              color: Colors.transparent,
            ),
            subNotes(),
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                ),
                splashRadius: 12,
              ),
              title: Padding(
                padding: const EdgeInsets.only(right:15.0),
                child: TextFormField(
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
            ),
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
      itemCount: note?.subNotes?.length ?? 0,
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
      title: Text(
        note?.subNotes?[index]?.text ?? 'bune',
        style: Theme.of(context).textTheme.subtitle2,
      ),
    );
  }
}
