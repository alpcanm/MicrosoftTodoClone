import 'package:bot_2000/core/models/notes/note.dart';
import 'package:bot_2000/core/view_model/view_note_methods.dart';
import 'package:bot_2000/core/view_model/note_viewmodel.dart';
import 'package:bot_2000/view/components/home_components/right_side/components/card_components/card_bottom.dart';

import 'package:bot_2000/view/components/home_components/right_side/components/right_bottom.dart';
import 'package:bot_2000/view/widgets/stream_builder.dart';

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
      final noteMethods = ViewNoteMethods();
      return SizedBox(
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            streramBuilder(noteMethods, _note, context),
            RightBottom(
              createdAt: _note.createdAt!.toString(),
              lastUpdate: _note.lastUpdate!.toString(),
            )
          ],
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  Form addSubNotes(BuildContext context, String noteId) {
    final TextEditingController _controller = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Form(
      key: _formKey,
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        leading: IconButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              final _noteMethods = ViewNoteMethods();
              await _noteMethods.postSubNote(
                  relationId: noteId, text: _controller.text);
              _controller.clear();
            }
          },
          icon: const Icon(
            Icons.add,
          ),
          splashRadius: 12,
        ),
        title: Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: TextFormField(
            controller: _controller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Lütfen bir şeyler yazınız.";
              } else {
                return null;
              }
            },
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
      ),
    );
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
                  return Column(
                    children: [
                      CardTop(note: snapshot.data!),
                      const CardBottom(),
                    ],
                  );
                }),
            addSubNotes(context, _note.noteId!),
          ],
        ),
      ),
    );
  }
}
