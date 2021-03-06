import 'package:bot_2000/core/abstraction/notes_logic.dart';
import 'package:bot_2000/core/models/notes/note.dart';
import 'package:bot_2000/core/models/notes/note_book.dart';
import 'package:bot_2000/core/get_it/get_it.dart';
import 'package:bot_2000/core/bridge.dart';

class ViewNoteMethods implements NotesLogic {
  final Bridge _bridge = getIt<Bridge>();

  @override
  Stream<List<NoteBook?>> getNoteBooks(String userId) {
    return _bridge.getNoteBooks(userId);
  }

  @override
  Stream<List<Note?>> getNotes(String relNoteBookId) {
    return _bridge.getNotes(relNoteBookId);
  }

  @override
  Future<bool> postNoteBook({String? relationId, required int sequence}) {
    return _bridge.postNoteBook(relationId: relationId, sequence: sequence);
  }

  @override
  Future<bool> updateField(
      {required String relationId,
      required String tableName,
      required value,
      required String columnName}) {
    return _bridge.updateField(
        tableName: tableName,
        value: value,
        relationId: relationId,
        columnName: columnName);
  }

  @override
  Future<bool> postNote(
      {required String relationId,
      required String text,
      required int sequence}) {
    return _bridge.postNote(
        text: text, relationId: relationId, sequence: sequence);
  }

  @override
  Future<bool> postSubNote(
      {required String relationId,
      required String text,
      required int sequence}) {
    return _bridge.postSubNote(
        text: text, relationId: relationId, sequence: sequence);
  }

  @override
  Stream<Note?> getANote(String noteId) {
    return _bridge.getANote(noteId);
  }
}
