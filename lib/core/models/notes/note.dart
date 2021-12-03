import 'package:bot_2000/core/models/notes/sub_note.dart';

class Note {
  String? noteId;
  String? relNoteBookId;
  String? text;
  bool? isMajor;
  bool? isComplete;
  bool? isVisible;
  Stream<List<SubNote?>?>? subNotes;
  String? comment;
  String? createdAt;
  String? lastUpdate;
  Note({
    this.noteId,
    this.relNoteBookId,
    this.text,
    this.isMajor,
    this.isComplete,
    this.subNotes,
    this.comment,
    this.createdAt,
    this.lastUpdate,
  });
}
