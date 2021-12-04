import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bot_2000/core/view_model/view_model.dart';

class NoteBookButton extends StatefulWidget {
  const NoteBookButton({
    Key? key,
    required this.title,
    this.iconData,
    this.subTitle,
    required this.noteBookId,
  }) : super(key: key);
  final String title;
  final String? iconData;
  final String? subTitle;
  final String noteBookId;
  @override
  _NoteBookButtonState createState() => _NoteBookButtonState();
}

class _NoteBookButtonState extends State<NoteBookButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
        leading: const Icon(Icons.note),
        title: Row(
          children: [
            Expanded(
                flex: 13,
                child: Text(
                  widget.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                )),
            Expanded(flex: 2, child: Text(widget.subTitle ?? ""))
          ],
        ),
        //subtitle: ,
      ),
      onTap: () {
        final _viewModel = Provider.of<ViewModel>(context, listen: false);
        _viewModel.noteId = widget.noteBookId;
      },
    );
  }
}
