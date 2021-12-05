import 'package:bot_2000/core/models/notes/note.dart';
import 'package:bot_2000/core/view_model/note_methods.dart';
import 'package:bot_2000/core/view_model/view_model.dart';
import 'package:bot_2000/view/components/center/top/center_top.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CenterStream extends StatelessWidget {
  const CenterStream({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _viewModel = Provider.of<ViewModel>(context);
    final noteMethods = NoteMethods();
    return StreamBuilder<List<Note?>>(
      stream: noteMethods.getNotes(_viewModel.noteBookId),
      builder: (context, AsyncSnapshot<List<Note?>> snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Text("None");
            case ConnectionState.waiting:
              return const Center(
                child: SizedBox(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                  width: 60,
                  height: 60,
                ),
              );
            case ConnectionState.active:
              List<Note?> _result = snapshot.data!;
              return NoteTable(
                notes: _result,
              );
            case ConnectionState.done:
              return const Text("Done");
            default:
              return const Text("Default");
          }
        }
      },
    );
  }
}
