import 'package:bot_2000/core/models/notes/note.dart';
import 'package:bot_2000/core/view_model/note_viewmodel.dart';
import 'package:bot_2000/view/components/home_components/right_side/card_components/card_bottom.dart';
import 'package:bot_2000/view/components/home_components/right_side/card_components/card_top.dart';
import 'package:bot_2000/view/components/home_components/right_side/components/right_bottom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RightArea extends StatelessWidget {
  const RightArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _noteViewModel = Provider.of<NoteViewModel>(context);
    if (_noteViewModel.currentNote != null) {
      Note _note = _noteViewModel.currentNote!;
      return SizedBox(
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                    child: Column(
                  children: [
                    CardTop(note: _note),
                    const CardBottom(),
                  ],
                ))),
            RightBottom(
              createdAt: _note.createdAt!,
              lastUpdate: _note.lastUpdate!,
            )
          ],
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
