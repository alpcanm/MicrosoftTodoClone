import 'package:bot_2000/core/models/notes/note.dart';
import 'package:bot_2000/core/view_model/view_note_methods.dart';
import 'package:bot_2000/core/view_model/view_model.dart';
import 'package:bot_2000/view/components/home_components/center/components/center_top.dart';
import 'package:bot_2000/view/widgets/stream_builder.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CenterStream extends StatelessWidget {
  const CenterStream({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _viewModel = Provider.of<ViewModel>(context);
    final noteMethods = ViewNoteMethods();

    return StreamBuilderExtension<List<Note?>>(
        body: (context, snapshot) {
          List<Note?> _result = snapshot.data ?? [];
          return NoteTable(
            notes: _result,
          );
        },
        stream: noteMethods.getNotes(_viewModel.noteBookId));
  }
}
