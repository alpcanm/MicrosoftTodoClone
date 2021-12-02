import 'package:bot_2000/core/models/notes/sub_note.dart';

class Note {
  String? noteId;
  String? noteBookId;
  String? title;
  bool? isMajor;
  bool? isComplete;
  List<SubNote?>? subNotes;
  String? comment;
  String? createdAt;
  String? lastUpdate;
  Note({
    this.noteId,
    this.noteBookId,
    this.title,
    this.isMajor,
    this.isComplete,
    this.subNotes,
    this.comment,
    this.createdAt,
    this.lastUpdate,
  });
}
