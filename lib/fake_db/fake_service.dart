import 'package:bot_2000/core/models/notes/note.dart';
import 'package:bot_2000/core/models/notes/note_book.dart';
import 'package:bot_2000/core/models/notes/sub_note.dart';
import 'package:bot_2000/core/models/user.dart';
import 'package:bot_2000/core/packages/get_it.dart';
import 'package:bot_2000/fake_db/fake_api.dart';

class FakeService {
  final FakeApi _fakeApi = getIt<FakeApi>();

  Future<User?> getCurrentUser() async {
    await Future.delayed(Duration.zero);
    return _fakeApi.currentUser;
  }

  Stream<List<NoteBook?>> fakeNotebooks() async* {
    while (true) {
      await Future.delayed(const Duration(milliseconds: 500));
      List<NoteBook?>? someProduct = _fakeApi.notebookList;
      yield someProduct;
    }
  }

  Stream<List<Note?>?> fakeNotes() async* {
    while (true) {
      await Future.delayed(const Duration(milliseconds: 500));
      List<Note?>? someProduct = _fakeApi.noteList;
      yield someProduct;
    }
  }

  Stream<List<SubNote?>?> fakeSubNotes() async* {
    while (true) {
      await Future.delayed(const Duration(milliseconds: 500));
      List<SubNote?>? someProduct = _fakeApi.subnoteList;
      yield someProduct;
    }
  }

  Stream<List<NoteBook?>> getNoteBooks() {
    List<NoteBook?> _result = [];
    for (int i = 0; i < 4; i++) {
      // Alp can kullanıcısına ait note book ları getir.

    }
    return fakeNotebooks();
  }
}
