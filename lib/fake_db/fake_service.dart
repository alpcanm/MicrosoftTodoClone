import 'package:bot_2000/core/models/notes/note_book.dart';
import 'package:bot_2000/core/packages/get_it.dart';
import 'package:bot_2000/fake_db/fake_db.dart';

class FakeService {
  final FakeDB _fakeDB = getIt<FakeDB>();

  Stream<List<NoteBook?>?>? fakeNotebooks() async* {
    while (false) {
      await Future.delayed(const Duration(milliseconds: 500));
      List<NoteBook?>? someProduct = _fakeDB.notebookList;
      yield someProduct;
    }
  }
}
