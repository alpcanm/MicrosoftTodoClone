import 'dart:async';
import 'package:bot_2000/core/models/notes/note.dart';
import 'package:bot_2000/core/models/notes/note_book.dart';
import 'package:bot_2000/core/models/user.dart';
import 'package:bot_2000/core/get_it/get_it.dart';
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
      // paralel çalışır. bir kere çağırıldığı için paralel çalışmıyor.
      _noteBooks = await _fakeApi.getNoteBooks(userId);
      _streamController.sink.add(_noteBooks);
    });
    return _streamController.stream;
  }

  List<Note?> notes = [];
  Stream<List<Note?>> getNotes(String relNoteBookId) async* {
    // Seri  çalışır.veri kaybı yaşamamık için bunu kullan.
    while (true) {
      await Future.delayed(const Duration(milliseconds: 500));
      notes = await _fakeApi.getAllNotes(relNoteBookId);
      yield notes;
    }
  }

  Stream<Note?> getANote(String noteId) async* {
    while (true) {
      await Future.delayed(const Duration(milliseconds: 500));
      Note? _note = notes
          .where((element) => element!.noteId == noteId ? true : false)
          .toList()
          .first;
      yield _note;
    }
  }
}
