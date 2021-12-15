
import 'package:bot_2000/core/view_model/view_note_methods.dart';
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
              label: const Text('Yeni not defteri ekle')),
        )
      ],
    ));
  }

  postNoteBook(BuildContext context) async {
    final _viewModel = Provider.of<ViewModel>(context, listen: false);
    if (_viewModel.user != null) {
      final String _userId = _viewModel.user!.userId!;
      final _noteMethods = ViewNoteMethods();
      await _noteMethods.postNoteBook(
          relationId: _userId);
    }
  }
}
