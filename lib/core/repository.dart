import 'package:bot_2000/core/abstraction/notes_logic.dart';
import 'package:bot_2000/core/abstraction/user_logic.dart';
import 'package:bot_2000/core/models/notes/note.dart';
import 'package:bot_2000/core/models/notes/note_book.dart';
import 'package:bot_2000/core/models/user.dart';
import 'package:bot_2000/core/packages/get_it.dart';
import 'package:bot_2000/core/services/notes_services.dart';
import 'package:bot_2000/core/services/user_services.dart';
import 'package:bot_2000/fake_db/fake_service.dart';

enum Version { debug, realese }

class Repository implements UserLogic, NotesLogic {
  final Version _version = Version.debug;

  final FakeService _fakeService = getIt<FakeService>();
  final UserServices _userServices = getIt<UserServices>();
  final NoteServices _noteServices = getIt<NoteServices>();

  @override
  Future<User?> getCurrentUser() async {
    if (_version == Version.debug) {
      return await _fakeService.getCurrentUser();
    } else {
      return await _userServices.getCurrentUser();
    }
  }

  @override
  Stream<List<NoteBook?>> getNoteBooks({String? userId}) {
    if (_version == Version.debug) {
      return _fakeService.getNoteBooks(userId: userId);
    } else {
      return _noteServices.getNoteBooks(userId: userId);
    }
  }

  @override
  Stream<List<Note?>>? getNotes(String relNoteBookId) {
    if (_version == Version.debug) {
      return _fakeService.getNotes(relNoteBookId);
    } else {
      return _noteServices.getNotes(relNoteBookId);
    }
  }
}
