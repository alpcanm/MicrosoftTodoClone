import 'package:bot_2000/core/abstraction/notes_logic.dart';
import 'package:bot_2000/core/abstraction/user_logic.dart';
import 'package:bot_2000/core/models/notes/note.dart';
import 'package:bot_2000/core/models/notes/note_book.dart';
import 'package:bot_2000/core/models/user.dart';
import 'package:bot_2000/core/get_it/get_it.dart';
import 'package:bot_2000/core/services/notes_services.dart';
import 'package:bot_2000/core/services/user_services.dart';

class Bridge implements UserLogic, NotesLogic {
  final UserServices _userServices = getIt<UserServices>();
  final NoteServices _noteServices = getIt<NoteServices>();

  @override
  Future<User?> getCurrentUser() async {
    return await _userServices.getCurrentUser();
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
  Future<bool> postNoteBook({String? relationId}) {
    return _noteServices.postNoteBook(relationId: relationId);
  }

  @override
  Future<bool> updateField(
      {required String relationId,
      required String tableName,
      required value,
      required String columnName}) {
    return _noteServices.updateField(
        tableName: tableName,
        value: value,
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

  @override
  Future logOut() async {
    return _userServices.logOut();
  }

  @override
  Future<User?> logIn({required String mail, required String password}) {
    return _userServices.logIn(mail: mail, password: password);
  }

  @override
  Future<bool> registerUser(
      {required String name,
      required String surname,
      required String mail,
      required String password,
      String? phoneNumber}) {
    return _userServices.registerUser(
        mail: mail,
        password: password,
        name: name,
        surname: surname,
        phoneNumber: phoneNumber);
  }
}
