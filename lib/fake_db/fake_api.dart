import 'package:bot_2000/core/models/notes/note.dart';
import 'package:bot_2000/core/models/notes/note_book.dart';
import 'package:bot_2000/core/models/notes/sub_note.dart';
import 'package:bot_2000/core/models/user.dart';
import 'package:bot_2000/fake_db/fake_db.dart';

class FakeApi {
  final List<SubNote?> subnoteList = [];
  final List<Note?> noteList = [];
  final List<NoteBook?> notebookList = [];
  User? currentUser;

  FakeApi() {
    currentUser = FakeUser.user;
    print(currentUser);
  }
}
