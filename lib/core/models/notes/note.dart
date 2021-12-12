import 'dart:convert';

import 'package:bot_2000/core/models/notes/sub_note.dart';

class Note {
  String? noteId;
  String? relNoteBookId;
  String? text;
  bool? isMajor;
  bool? isComplete;
  bool? isVisible;
  List<SubNote?>? subNotes;
  String? comment;
  DateTime? createdAt;
  DateTime? lastUpdate;
  int? sequence;
  Note({
    this.noteId,
    this.relNoteBookId,
    this.text,
    this.isMajor,
    this.isComplete,
    this.isVisible,
    this.subNotes,
    this.comment,
    this.createdAt,
    this.lastUpdate,
    this.sequence,
  });

  Map<String, dynamic> toMap() {
    return {
      'note_id': noteId,
      'rel_notebook_id': relNoteBookId,
      'text': text,
      'is_major': isMajor,
      'is_complete': isComplete,
      'is_visible': isVisible,
      'comment': comment,
      'created_at': createdAt.toString(),
      'last_update': lastUpdate.toString(),
      'sequence': sequence,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      noteId: map['note_id'].toString(),
      relNoteBookId: map['rel_notebook_id'].toString(),
      text: map['text'],
      isMajor: map['is_major'],
      isComplete: map['is_complete'],
      isVisible: map['is_visible'],
      comment: map['comment'],
      createdAt: DateTime.tryParse((map['created_at'])),
      lastUpdate: DateTime.tryParse(map['last_update']),
      sequence: map['sequence'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) => Note.fromMap(json.decode(source));
}
