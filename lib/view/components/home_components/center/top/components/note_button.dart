import 'package:bot_2000/core/view_model/note_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:bot_2000/core/models/notes/note.dart';
import 'package:provider/provider.dart';

class NoteButton extends StatefulWidget {
  const NoteButton({
    Key? key,
    required this.note,
  }) : super(key: key);
  final Note note;
  @override
  _NoteButtonState createState() => _NoteButtonState();
}

class _NoteButtonState extends State<NoteButton> {
  @override
  Widget build(BuildContext context) {
    Note _note = widget.note;
    return Card(
      color: Theme.of(context).cardColor,
      child: InkWell(
        child: ListTile(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.circle_outlined,
            ),
            splashRadius: 12,
          ),
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              _note.text!,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
        onTap: () {
          final _noteViewModel =
              Provider.of<NoteViewModel>(context, listen: false);
          _noteViewModel.currentNote = _note;
        },
      ),
    );
  }
}
