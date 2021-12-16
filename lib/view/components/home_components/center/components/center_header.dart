import 'package:bot_2000/core/keys.dart';
import 'package:bot_2000/core/view_model/note_viewmodel.dart';
import 'package:bot_2000/core/view_model/view_note_methods.dart';
import 'package:bot_2000/view/widgets/alert_dialog.dart';
import 'package:bot_2000/view/widgets/text_and_field.dart';
import 'package:flutter/material.dart';
import 'package:bot_2000/core/view_model/view_model.dart';
import 'package:provider/provider.dart';

class CenterHeader extends StatefulWidget {
  const CenterHeader({Key? key}) : super(key: key);

  @override
  State<CenterHeader> createState() => _CenterHeaderState();
}

class _CenterHeaderState extends State<CenterHeader> {
  @override
  Widget build(BuildContext context) {
    final _viewModel = Provider.of<ViewModel>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: TextAndField(
              textStyle: Theme.of(context).textTheme.headline1!,
              text: _viewModel.noteBookText,
              columnName: Keys.columnText,
              tableName: Keys.tableNotebooks,
              relationId: _viewModel.noteBookId,
              callback: (value) {
                _viewModel.noteBookText = value;
              },
            ),
          ),
          IconButton(
            onPressed: () => _deleteNotebook(),
            icon: Icon(
              Icons.delete_forever,
              color: Theme.of(context).colorScheme.secondaryVariant,
            ),
            hoverColor: Colors.red,
            splashRadius: 20,
          )
        ],
      ),
    );
  }

  void _deleteNotebook() {
    final _noteMethod = ViewNoteMethods();
    final _viewModel = Provider.of<ViewModel>(context, listen: false);
    final _viewModelNote = Provider.of<NoteViewModel>(context, listen: false);

    MyAlertDialog.showMyDialog(
        context: context,
        onApprove: () async {
          await _noteMethod.updateField(
              relationId: _viewModel.noteBookId,
              tableName: Keys.tableNotebooks,
              value: false,
              columnName: Keys.columnIsVisible);
          _viewModel.noteBookId = '';
          _viewModelNote.currentNote = null;
        },
        text: _viewModel.noteBookText);
  }
}
