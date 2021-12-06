import 'package:bot_2000/core/abstraction/notes_logic.dart';
import 'package:bot_2000/core/models/notes/note.dart';
import 'package:bot_2000/core/models/notes/note_book.dart';
import 'package:bot_2000/core/packages/get_it.dart';
import 'package:bot_2000/core/repository.dart';

class NoteMethods implements NotesLogic {
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
      {String? relationId, required String tableName, required field}) {
    return _repository.updateField(
        tableName: tableName, field: field, relationId: relationId);
  }

  @override
  Future<bool> postNote(
      {required String relationId, required String tableName, object}) {
    // TODO: implement postNote
    throw UnimplementedError();
  }

  @override
  Future<bool> postSubNote(
      {required String relationId, required String tableName, object}) {
    // TODO: implement postSubNote
    throw UnimplementedError();
  }

  @override
  Stream<Note?> getANote(String noteId) {
     return _repository.getANote(noteId);
  }
}
