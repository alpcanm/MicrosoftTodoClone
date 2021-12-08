import 'package:bot_2000/core/models/notes/note.dart';
import 'package:bot_2000/core/view_model/note_methods.dart';
import 'package:bot_2000/core/view_model/note_viewmodel.dart';
import 'package:bot_2000/view/components/home_components/right_side/components/card_components/card_bottom.dart';

import 'package:bot_2000/view/components/home_components/right_side/components/right_bottom.dart';
import 'package:bot_2000/view/components/stream_builder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/card_components/card_top.dart';

class RightArea extends StatelessWidget {
  const RightArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _noteViewModel = Provider.of<NoteViewModel>(context);
    if (_noteViewModel.currentNote != null) {
      Note _note = _noteViewModel.currentNote!;
      final noteMethods = NoteMethods();
      return SizedBox(
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: StreamBuilderExtension<Note?>(
                    stream: noteMethods.getANote(_note.noteId!),
                    body: (context, AsyncSnapshot<Note?> snapshot) {
                      return Column(
                        children: [
                          CardTop(note: snapshot.data),
                          const CardBottom(),
                        ],
                      );
                    }),
              ),
            ),
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
