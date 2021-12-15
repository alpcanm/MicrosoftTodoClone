import 'package:flutter/material.dart';
import 'package:bot_2000/core/view_model/view_note_methods.dart';

class TextAndField extends StatefulWidget {
  const TextAndField({
    Key? key,
    required this.text,
    required this.columnName,
    required this.tableName,
    required this.relationId,
    required this.textStyle,
    this.callback,
  }) : super(key: key);
  final String text;
  final String columnName;
  final String tableName;
  final String relationId;
  final TextStyle textStyle;
  final Function(dynamic callBack)? callback;
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

  void onTap() {
    setState(() {
      _isEditable = !_isEditable;
      myFocusNode.requestFocus();
      _controler.text = widget.text;
    });
  }

  void onHover(value) {
    setState(() {
      _isHover = value;
    });
  }

  onEditingComplete() {
    final _noteMethods = ViewNoteMethods();
    _noteMethods.updateField(
        relationId: widget.relationId,
        tableName: widget.tableName,
        value: _controler.text,
        columnName: widget.columnName);
    myFocusNode.unfocus();
    widget.callback?.call(_controler.text);
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: InkWell(
        onTap: onTap,
        onHover: onHover,
        child: child,
      ),
    );
  }

  Widget get child {
    if ((!_isEditable && !myFocusNode.hasFocus)) {
      return Text(
        widget.text,
        style: widget.textStyle.copyWith(
          decoration: _isHover ? TextDecoration.underline : null,
        ),
      );
    } else {
      return TextField(
        onEditingComplete: () => onEditingComplete(),
        controller: _controler,
        focusNode: myFocusNode,
        style: widget.textStyle.copyWith(
          decoration: _isHover ? TextDecoration.underline : null,
        ),
      );
    }
  }
}
