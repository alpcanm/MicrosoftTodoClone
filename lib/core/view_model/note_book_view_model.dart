import 'package:bot_2000/core/models/notes/note_book.dart';
import 'package:bot_2000/core/packages/get_it.dart';
import 'package:bot_2000/fake_db/fake_service.dart';
import 'package:flutter/cupertino.dart';

class NoteBookVM with ChangeNotifier {
  final FakeService _fakeService = getIt<FakeService>();

  Stream<List<NoteBook?>?>? _noteBooklist;

  Stream<List<NoteBook?>?>? get noteBookList => _noteBooklist;

  set noteBookList(Stream<List<NoteBook?>?>? noteBook) {
    _noteBooklist = noteBook;
    notifyListeners();
  }

  Stream<List<NoteBook?>?>? getNoteBooks() {
    return _fakeService.fakeNotebooks();
  }
}
