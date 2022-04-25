import 'dart:convert';
import 'package:bot_2000/core/models/notes/note.dart';

class NoteBook {
  String? noteBookId;
  String? relUserId;
  String? text;
  DateTime? createdAt;
  DateTime? lastUpdate;
  bool? isVisible;
  List<Note?>? noteList;
  String? iconData;
  int? sequence;
  NoteBook(
      {this.noteBookId,
      this.relUserId,
      this.text,
      this.createdAt,
      this.lastUpdate,
      this.isVisible,
      this.noteList,
      this.iconData,
      this.sequence});

  Map<String, dynamic> toMap() {
    return {
      '_id': noteBookId,
      'rel_user_id': relUserId,
      'text': text,
      'created_at': createdAt.toString(),
      'last_update': lastUpdate.toString(),
      'is_visible': isVisible,
      'icon_data': iconData,
      'sequence': sequence,
    };
  }

  factory NoteBook.fromMap(Map<String, dynamic> map) {
    return NoteBook(
      noteBookId: map['_id'].toString(),
      relUserId: map['rel_user_id'],
      text: map['text'],
      createdAt: DateTime.tryParse(map['created_at']),
      lastUpdate: DateTime.tryParse(map['last_update']),
      isVisible: map['is_visible'],
      iconData: map['icon_data'],
      sequence: map['sequence'],
    );
  }

  String toJson() => json.encode(toMap());

  factory NoteBook.fromJson(String source) =>
      NoteBook.fromMap(json.decode(source));

  @override
  String toString() {
    return 'NoteBook(noteBookId: $noteBookId, relUserId: $relUserId, text: $text, createdAt: $createdAt, lastUpdate: $lastUpdate, isVisible: $isVisible, noteList: $noteList, iconData: $iconData, sequence: $sequence)';
  }
}
