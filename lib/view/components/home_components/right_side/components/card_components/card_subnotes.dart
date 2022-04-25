import 'package:bot_2000/core/models/notes/sub_note.dart';
import 'package:bot_2000/view/components/home_components/right_side/components/card_components/subnote_list.dart';
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
    return SizedBox(
      height: 200,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: note.subNotes?.length ?? 0,
        itemBuilder: (context, index) {
          SubNote _subnote = note.subNotes?[index] ?? SubNote();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SubnoteWigdet(subnote: _subnote),
              const Divider(
                height: 0,
                indent: 15,
                endIndent: 15,
              ),
            ],
          );
        },
      ),
    );
  }
}
