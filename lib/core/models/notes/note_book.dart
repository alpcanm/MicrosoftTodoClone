import 'package:bot_2000/core/models/notes/note.dart';

class NoteBook {
  String? noteBookId;
  String? relUserId;
  String? text;
  String? createdAt;
  String? lastUpdate;
  bool? isVisible;
  Stream<List<Note?>?>? noteList;
  String? iconData;
  NoteBook({
    this.noteBookId,
    this.relUserId,
    this.text,
    this.noteList,
    this.iconData,
  });
}
