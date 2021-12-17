import 'package:bot_2000/core/abstraction/notes_logic.dart';
import 'package:bot_2000/core/models/notes/note.dart';
import 'package:bot_2000/core/models/notes/note_book.dart';
import 'package:bot_2000/core/get_it/get_it.dart';
import 'package:bot_2000/core/repository.dart';

class ViewNoteMethods implements NotesLogic {
  final Repository _repository = getIt<Repository>();
  String check = "00";

  _logOut() {}

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
  }) {
    return _repository.postNoteBook(relationId: relationId);
  }

  @override
  Future<bool> updateField(
      {required String relationId,
      required String tableName,
      required value,
      required String columnName}) {
    return _repository.updateField(
        tableName: tableName,
        value: value,
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
