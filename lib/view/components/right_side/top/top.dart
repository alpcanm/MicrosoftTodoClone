import 'package:bot_2000/core/models/notes/note.dart';
import 'package:bot_2000/core/view_model/view_model.dart';
import 'package:bot_2000/view/components/right_side/top/top_stfl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RightTop extends StatelessWidget {
  const RightTop({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _viewModel = Provider.of<ViewModel>(context);
    return StreamBuilder<List<Note?>>(
      stream: _viewModel.getNotes(_viewModel.noteId),
      builder: (context, AsyncSnapshot<List<Note?>> snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Text("None");
            case ConnectionState.waiting:
              return const Text("Waiting");
            case ConnectionState.active:
              List<Note?> _result = snapshot.data!;
              return RightTable(
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
