import 'dart:convert';

import 'package:bot_2000/core/models/notes/note.dart';

class NoteBook {
  String? noteBookId;
  String? relUserId;
  String? text;
  String? createdAt;
  String? lastUpdate;
  bool? isVisible;
  List<Note?>? noteList;
  String? iconData;
  NoteBook({
    this.noteBookId,
    this.relUserId,
    this.text,
    this.createdAt,
    this.lastUpdate,
    this.isVisible,
    this.noteList,
    this.iconData,
  });

  Map<String, dynamic> toMap() {
    return {
      'noteBookId': noteBookId,
      'relUserId': relUserId,
      'text': text,
      'createdAt': createdAt,
      'lastUpdate': lastUpdate,
      'isVisible': isVisible,
      'iconData': iconData,
    };
  }

  factory NoteBook.fromMap(Map<String, dynamic> map) {
    return NoteBook(
      noteBookId: map['noteBookId'],
      relUserId: map['relUserId'],
      text: map['text'],
      createdAt: map['createdAt'],
      lastUpdate: map['lastUpdate'],
      isVisible: map['isVisible'],
      iconData: map['iconData'],
    );
  }

  String toJson() => json.encode(toMap());

  factory NoteBook.fromJson(String source) =>
      NoteBook.fromMap(json.decode(source));
}
