import 'package:bot_2000/core/view_model/note_viewmodel.dart';
import 'package:flutter/material.dart';

import 'package:bot_2000/core/keys.dart';
import 'package:bot_2000/core/view_model/view_note_methods.dart';
import 'package:bot_2000/view/widgets/alert_dialog.dart';
import 'package:provider/provider.dart';

class RightBottom extends StatelessWidget {
  const RightBottom({
    Key? key,
    required this.lastUpdate,
    required this.createdAt,
    required this.noteText,
    required this.noteId,
  }) : super(key: key);
  final String lastUpdate;
  final String createdAt;
  final String noteText;
  final String noteId;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: SizedBox(
        child: Column(children: [
          Text(
            'Son güncelleme: $lastUpdate',
            style: Theme.of(context).textTheme.caption,
            textAlign: TextAlign.center,
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Oluşturuldu: $createdAt',
                style: Theme.of(context).textTheme.caption,
              ),
              IconButton(
                onPressed: () => MyAlertDialog.showMyDialog(
                    context: context,
                    onApprove: () => _onApprove(context),
                    text: noteText),
                icon: const Icon(Icons.delete_outlined),
                iconSize: 32,
              )
            ],
          ),
        ]),
      ),
    );
  }

  void _onApprove(BuildContext context) async {
    final _noteMethods = ViewNoteMethods();
    await _noteMethods.updateField(
        tableName: Keys.tableNotes,
        value: false,
        columnName: Keys.columnIsVisible,
        relationId: noteId);
    final _noteViewModel = Provider.of<NoteViewModel>(context, listen: false);
    _noteViewModel.currentNote = null;
  }
}
