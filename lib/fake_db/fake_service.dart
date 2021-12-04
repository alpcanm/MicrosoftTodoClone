import 'dart:async';
import 'package:bot_2000/core/models/notes/note.dart';
import 'package:bot_2000/core/models/notes/note_book.dart';
import 'package:bot_2000/core/models/user.dart';
import 'package:bot_2000/core/packages/get_it.dart';
import 'package:bot_2000/fake_db/fake_api.dart';

class FakeService {
  final FakeApi _fakeApi = getIt<FakeApi>();

  User? _user;
  Future<User?> getCurrentUser() async {
    String response = await _fakeApi.getCurrentUser();
    _user = User.fromJson(response);
    return _user;
  }

  Stream<List<NoteBook?>> getNoteBooks(String userId) {
    List<NoteBook?> _noteBooks = [];
    StreamController<List<NoteBook?>> _streamController = StreamController();
    Timer.periodic(const Duration(milliseconds: 500), (Timer t) async {
      _noteBooks = await _fakeApi.getNoteBooks(userId);
      _streamController.sink.add(_noteBooks);
    });
    return _streamController.stream;
  }

  Stream<List<Note?>> getNotes(String relNoteBookId) {
    List<Note?> notes = [];
    StreamController<List<Note?>> _streamController = StreamController();
    Timer.periodic(const Duration(milliseconds: 500), (Timer t) async {
      notes = await _fakeApi.getAllNotes(relNoteBookId);
      _streamController.sink.add(notes);
    });
    return _streamController.stream;
  }
}
