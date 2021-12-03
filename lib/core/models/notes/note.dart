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
  String? createdAt;
  String? lastUpdate;
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
  });

  Map<String, dynamic> toMap() {
    return {
      'noteId': noteId,
      'relNoteBookId': relNoteBookId,
      'text': text,
      'isMajor': isMajor,
      'isComplete': isComplete,
      'isVisible': isVisible,
      'comment': comment,
      'createdAt': createdAt,
      'lastUpdate': lastUpdate,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      noteId: map['noteId'],
      relNoteBookId: map['relNoteBookId'],
      text: map['text'],
      isMajor: map['isMajor'],
      isComplete: map['isComplete'],
      isVisible: map['isVisible'],
      comment: map['comment'],
      createdAt: map['createdAt'],
      lastUpdate: map['lastUpdate'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) => Note.fromMap(json.decode(source));
}
