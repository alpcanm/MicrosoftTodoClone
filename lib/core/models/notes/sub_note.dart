import 'dart:convert';

class SubNote {
  String? subNoteId;
  String? relNoteId;
  String? text;
  bool? isComplete;
  bool? isVisible;
  String? createdAt;

  SubNote({
    this.subNoteId,
    this.relNoteId,
    this.text,
    this.isComplete,
    this.isVisible,
    this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'subNoteId': subNoteId,
      'relNoteId': relNoteId,
      'text': text,
      'isComplete': isComplete,
      'isVisible': isVisible,
      'createdAt': createdAt,
    };
  }

  factory SubNote.fromMap(Map<String, dynamic> map) {
    return SubNote(
      subNoteId: map['subNoteId'],
      relNoteId: map['relNoteId'],
      text: map['text'],
      isComplete: map['isComplete'],
      isVisible: map['isVisible'],
      createdAt: map['createdAt'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SubNote.fromJson(String source) =>
      SubNote.fromMap(json.decode(source));
}
