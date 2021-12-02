import 'package:bot_2000/core/models/notes/note_book.dart';
import 'package:bot_2000/core/packages/get_it.dart';
import 'package:bot_2000/fake_db/fake_db.dart';
import 'package:flutter/cupertino.dart';

class NoteBookVM with ChangeNotifier {
  final FakeDB _fakeDB = getIt<FakeDB>();

  List<NoteBook?>? _noteBooklist;

  List<NoteBook?>? get noteBookList => _noteBooklist;

  set noteBookList(List<NoteBook?>? noteBook) {
    _noteBooklist = noteBook;
    notifyListeners();
   
  }

  NoteBookVM() {
    getNoteBookList();
  }
  Future<void> getNoteBookList() async {
    await Future.delayed(const Duration(seconds: 1));
    noteBookList = _fakeDB.notebookList;
     print(_fakeDB.notebookList);
  }
}
