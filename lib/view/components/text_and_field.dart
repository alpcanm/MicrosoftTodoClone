import 'package:flutter/material.dart';

import 'package:bot_2000/core/view_model/view_note_methods.dart';

class TextAndField extends StatefulWidget {
  const TextAndField({
    Key? key,
    required this.text,
    required this.columnName,
    required this.tableName,
    required this.relationId,
    this.callback,
  }) : super(key: key);
  final String text;
  final String columnName;
  final String tableName;
  final String relationId;
  final VoidCallback? callback;
  @override
  _TextAndFieldState createState() => _TextAndFieldState();
}

class _TextAndFieldState extends State<TextAndField> {
  bool _isHover = false;
  final TextEditingController _controler = TextEditingController();
  bool _isEditable = false;
  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    myFocusNode.addListener(() {
      if (!myFocusNode.hasFocus) {
        setState(() {
          _isEditable = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isEditable = !_isEditable;
          myFocusNode.requestFocus();
          _controler.text = widget.text;
        });
      },
      onHover: (value) {
        setState(() {
          _isHover = value;
        });
      },
      child: (!_isEditable && !myFocusNode.hasFocus)
          ? Text(
              widget.text,
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    decoration: _isHover ? TextDecoration.underline : null,
                  ),
            )
          : TextField(
              onEditingComplete: () {
                final _noteMethods = ViewNoteMethods();
                _noteMethods.updateField(
                    relationId: widget.relationId,
                    tableName: widget.tableName,
                    field: _controler.text,
                    columnName: widget.columnName);
                myFocusNode.unfocus();
                widget.callback?.call();
              },
              controller: _controler,
              focusNode: myFocusNode,
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    decoration: _isHover ? TextDecoration.underline : null,
                  ),
            ),
    );
  }
}
