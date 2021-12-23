import 'package:bot_2000/core/models/notes/note.dart';
import 'package:bot_2000/core/view_model/view_note_methods.dart';
import 'package:bot_2000/core/view_model/note_viewmodel.dart';
import 'package:bot_2000/view/components/home_components/right_side/components/card_components/card_add_subnotes.dart';
import 'package:bot_2000/view/components/home_components/right_side/components/right_bottom.dart';
import 'package:bot_2000/view/widgets/stream_builder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/card_components/card.dart';

class RightArea extends StatelessWidget {
  const RightArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _noteViewModel = Provider.of<NoteViewModel>(context);
    if (_noteViewModel.currentNote != null) {
      Note _note = _noteViewModel.currentNote!;
      final noteMethods = ViewNoteMethods();
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          streramBuilder(noteMethods, _note, context),
          RightBottom(
            createdAt: _note.createdAt!.toString(),
            lastUpdate: _note.lastUpdate!.toString(),
            noteText: _note.text!,
            noteId: _note.noteId!,
          )
        ],
      );
    } else {
      return const SizedBox();
    }
  }

  Padding streramBuilder(
      ViewNoteMethods noteMethods, Note _note, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          children: [
            StreamBuilderExtension<Note?>(
                stream: noteMethods.getANote(_note.noteId!),
                body: (context, AsyncSnapshot<Note?> snapshot) {
                  Note _note = snapshot.data!;
                  return RightCard(note: _note);
                }),
            AddSubnote(
              subNoteLength: _note.subNotes?.length,
              noteId: _note.noteId,
            ),
          ],
        ),
      ),
    );
  }
}
