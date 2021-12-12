import 'dart:convert';

class SubNote {
  String? subNoteId;
  String? relNoteId;
  String? text;
  bool? isComplete;
  bool? isVisible;
  DateTime? createdAt;
  int? sequence;
  SubNote({
    this.subNoteId,
    this.relNoteId,
    this.text,
    this.isComplete,
    this.isVisible,
    this.createdAt,
    this.sequence,
  });

  Map<String, dynamic> toMap() {
    return {
      'subnote_it': subNoteId,
      'rel_note_id': relNoteId,
      'text': text,
      'is_complete': isComplete,
      'is_visible': isVisible,
      'created_at': createdAt,
      'sequence': sequence,
    };
  }

  factory SubNote.fromMap(Map<String, dynamic> map) {
    return SubNote(
      subNoteId: map['subnote_it'].toString(),
      relNoteId: map['rel_note_id'].toString(),
      text: map['text'],
      isComplete: map['is_complete'],
      isVisible: map['is_visible'],
      createdAt: map['created_at'],
      sequence: map['sequence'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SubNote.fromJson(String source) =>
      SubNote.fromMap(json.decode(source));
}
