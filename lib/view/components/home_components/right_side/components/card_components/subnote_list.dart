import 'package:bot_2000/core/keys.dart';
import 'package:bot_2000/core/view_model/view_note_methods.dart';
import 'package:bot_2000/view/widgets/alert_dialog.dart';
import 'package:bot_2000/view/widgets/text_and_field.dart';
import 'package:flutter/material.dart';

import 'package:bot_2000/core/models/notes/sub_note.dart';

class SubnoteWigdet extends StatefulWidget {
  const SubnoteWigdet({
    Key? key,
    required this.subnote,
  }) : super(key: key);
  final SubNote subnote;
  @override
  _SubnoteWigdetState createState() => _SubnoteWigdetState();
}

class _SubnoteWigdetState extends State<SubnoteWigdet> {
  late FocusNode _focusNode;
  bool _showCancelButton = false;
  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() async {
      if (_focusNode.hasFocus) {
        setState(() {
          _showCancelButton = true;
        });
      } else {
        await Future.delayed(const Duration(milliseconds: 150));
        setState(() {
          _showCancelButton = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      focusNode: _focusNode,
      contentPadding: const EdgeInsets.all(0),
      leading: IconButton(
        onPressed: () => _completeButton(
            widget.subnote.isComplete!, widget.subnote.subNoteId!),
        icon: _isCompleteIconCheck(widget.subnote.isComplete!, context),
        splashRadius: 12,
      ),
      title: TextAndField(
        text: widget.subnote.text ?? '',
        columnName: Keys.columnText,
        relationId: widget.subnote.subNoteId ?? '',
        tableName: Keys.tableSubnotes,
        textStyle: _textStyleCheck(widget.subnote.isComplete!, context),
      ),
      trailing: _showCancelButton
          ? IconButton(
              onPressed: () => _cancelSubnote(),
              icon: const Icon(Icons.cancel_presentation),
              iconSize: 18,
              splashRadius: 18,
            )
          : const SizedBox(),
    );
  }

  void _cancelSubnote() {
    final _noteMethods = ViewNoteMethods();
    MyAlertDialog.showMyDialog(
        context: context,
        onApprove: () {
          _noteMethods.updateField(
              tableName: Keys.tableSubnotes,
              value: false,
              columnName: Keys.columnIsVisible,
              relationId: widget.subnote.subNoteId!);
        },
        text: widget.subnote.text!);
  }

  Icon _isCompleteIconCheck(bool isComplete, BuildContext context) {
    return isComplete
        ? Icon(Icons.check_circle_outlined,
            color: Theme.of(context).colorScheme.secondary)
        : const Icon(
            Icons.circle_outlined,
          );
  }

  TextStyle _textStyleCheck(bool isComplete, BuildContext context) {
    return isComplete
        ? Theme.of(context).textTheme.bodyText1!.copyWith(
            decoration: TextDecoration.lineThrough, color: Colors.grey)
        : Theme.of(context).textTheme.bodyText1!;
  }

  void _completeButton(bool isComplete, String subnoteId) {
    final _noteMethods = ViewNoteMethods();
    _noteMethods.updateField(
        tableName: Keys.tableSubnotes,
        value: !isComplete,
        columnName: Keys.columnIsComplete,
        relationId: subnoteId);
  }
}
