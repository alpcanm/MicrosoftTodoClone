import 'package:bot_2000/core/get_it/get_it.dart';
import 'package:bot_2000/core/services/notes_services.dart';
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
              icon: Icon(
                Icons.add_box_sharp,
                color: Theme.of(context).colorScheme.secondary,
              ),
              label: Text('Yeni not defteri ekle',
                  style: Theme.of(context).textTheme.bodyText1)),
        )
      ],
    ));
  }

  postNoteBook(BuildContext context) async {
    final _viewModel = Provider.of<ViewModel>(context, listen: false);

    if (_viewModel.user != null) {
      final String _userId = _viewModel.user!.userId!;
      final _noteMethods = ViewNoteMethods();
      final NoteServices _noteServices = getIt<NoteServices>();

      await _noteMethods.postNoteBook(
          relationId: _userId, sequence: _noteServices.notebookListLength);
    }
  }
}
