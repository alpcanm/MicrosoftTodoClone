import 'package:bot_2000/core/keys.dart';
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
    );
  }
}
