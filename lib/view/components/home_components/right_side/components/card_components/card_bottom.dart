import 'package:flutter/material.dart';

class CardBottom extends StatelessWidget {
  const CardBottom({
    Key? key,
    this.noteComment,
  }) : super(key: key);
  final String? noteComment;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            'Yorum',
            style: Theme.of(context).textTheme.headline3,
          ),
          const Divider(
            indent: 50,
            endIndent: 50,
          ),
          Text(
            noteComment ?? 'Yorum ekle',
            style: Theme.of(context).textTheme.bodyText2,
          )
        ],
      ),
    );
  }
}
