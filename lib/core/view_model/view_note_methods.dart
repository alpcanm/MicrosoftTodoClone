import 'package:bot_2000/core/abstraction/notes_logic.dart';
import 'package:bot_2000/core/models/notes/note.dart';
import 'package:bot_2000/core/models/notes/note_book.dart';
import 'package:bot_2000/core/get_it/get_it.dart';
import 'package:bot_2000/core/repository.dart';

class ViewNoteMethods implements NotesLogic {
  final Repository _repository = getIt<Repository>();

  @override
  Stream<List<NoteBook?>> getNoteBooks(String userId) {
    return _repository.getNoteBooks(userId);
  }

  @override
  Stream<List<Note?>> getNotes(String relNoteBookId) {
    return _repository.getNotes(relNoteBookId);
  }

  @override
  Future<bool> postNoteBook({
    String? relationId,
    required String tableName,
  }) {
    return _repository.postNoteBook(
        tableName: tableName, relationId: relationId);
  }

  @override
  Future<bool> updateField(
      {String? relationId,
      required String tableName,
      required field,
      required String columnName}) {
    return _repository.updateField(
        tableName: tableName,
        field: field,
        relationId: relationId,
        columnName: columnName);
  }

  @override
  Future<bool> postNote({required String relationId, required String text}) {
    return _repository.postNote(text: text, relationId: relationId);
  }

  @override
  Future<bool> postSubNote({required String relationId, required String text}) {
    return _repository.postSubNote(text: text, relationId: relationId);
  }

  @override
  Stream<Note?> getANote(String noteId) {
    return _repository.getANote(noteId);
  }
}
