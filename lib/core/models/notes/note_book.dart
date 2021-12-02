import 'package:flutter/material.dart';

import 'package:bot_2000/core/models/notes/note.dart';

class NoteBook {
  String? noteBookId;
  String? ownerId;
  String? title;
  List<Note?>? noteList;
  IconData? iconData;
  NoteBook({
    this.noteBookId,
    this.ownerId,
    this.title,
    this.noteList,
    this.iconData,
  });
}
