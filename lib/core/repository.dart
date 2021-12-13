import 'package:bot_2000/core/abstraction/notes_logic.dart';
import 'package:bot_2000/core/abstraction/user_logic.dart';
import 'package:bot_2000/core/models/notes/note.dart';
import 'package:bot_2000/core/models/notes/note_book.dart';
import 'package:bot_2000/core/models/user.dart';
import 'package:bot_2000/core/get_it/get_it.dart';
import 'package:bot_2000/core/services/notes_services.dart';
import 'package:bot_2000/core/services/user_services.dart';
import 'package:bot_2000/fake_db/fake_service.dart';

class Repository implements UserLogic, NotesLogic {
  final FakeService _fakeService = getIt<FakeService>();
  final UserServices _userServices = getIt<UserServices>();
  final NoteServices _noteServices = getIt<NoteServices>();

  @override
  Future<User?> getCurrentUser() async {
    return await _fakeService.getCurrentUser();
    // return await _userServices.getCurrentUser();
  }

  @override
  Stream<List<NoteBook?>> getNoteBooks(String userId) {
    return _noteServices.getNoteBooks(userId);
  }

  @override
  Stream<List<Note?>> getNotes(String relNoteBookId) {
    return _noteServices.getNotes(relNoteBookId);
  }

  @override
  Future<bool> postNoteBook({String? relationId, required String tableName}) {
    return _noteServices.postNoteBook(
        tableName: tableName, relationId: relationId);
  }

  @override
  Future<bool> updateField(
      {String? relationId,
      required String tableName,
      required field,
      required String columnName}) {
    return _noteServices.updateField(
        tableName: tableName,
        field: field,
        relationId: relationId,
        columnName: columnName);
  }

  @override
  Future<bool> postNote({required String relationId, required String text}) {
    return _noteServices.postNote(text: text, relationId: relationId);
  }

  @override
  Future<bool> postSubNote({required String relationId, required String text}) {
    return _noteServices.postSubNote(text: text, relationId: relationId);
  }

  @override
  Stream<Note?> getANote(String noteId) {
    return _noteServices.getANote(noteId);
  }
}
