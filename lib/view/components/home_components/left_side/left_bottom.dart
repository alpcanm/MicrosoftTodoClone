import 'package:bot_2000/core/models/notes/note_book.dart';
import 'package:bot_2000/core/view_model/note_methods.dart';
import 'package:bot_2000/core/view_model/view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LeftBottom extends StatelessWidget {
  const LeftBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(
      children: [
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton.icon(
              onPressed: () => postNoteBook(context),
              icon: const Icon(Icons.add_box_sharp),
              label: const Text("Yeni not defteri ekle")),
        )
      ],
    ));
  }

  postNoteBook(BuildContext context) async {
    final _viewModel = Provider.of<ViewModel>(context, listen: false);
    if (_viewModel.user != null) {
      final String _userId = _viewModel.user!.userId!;
      final _noteMethods = NoteMethods();
      await _noteMethods.postObject(
          relationId: _userId,
          tableName: "note_books",
          object: newNoteBook(_userId));
    }
  }

  NoteBook newNoteBook(String userId) {
    final String _now = DateTime.now().toString();
    NoteBook _noteBook = NoteBook(
      createdAt: _now,
      isVisible: true,
      lastUpdate: _now,
      relUserId: userId,
      text: "Yeni not defteri",
    );

    return _noteBook;
  }
}
