import 'package:bot_2000/core/keys.dart';
import 'package:bot_2000/view/components/text_and_field.dart';
import 'package:flutter/material.dart';
import 'package:bot_2000/core/view_model/view_model.dart';
import 'package:provider/provider.dart';

class CenterHeader extends StatelessWidget {
  const CenterHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _viewModel = Provider.of<ViewModel>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextAndField(
        text: _viewModel.noteBookText,
        columnName: Keys.columnText,
        tableName: Keys.tableNotebooks,
        relationId: _viewModel.noteBookId,
      ),
    );
  }
}
