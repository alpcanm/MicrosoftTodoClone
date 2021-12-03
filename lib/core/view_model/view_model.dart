import 'package:bot_2000/core/abstraction/notes_logic.dart';
import 'package:bot_2000/core/abstraction/user_logic.dart';
import 'package:bot_2000/core/models/notes/note_book.dart';
import 'package:bot_2000/core/models/user.dart';
import 'package:bot_2000/core/packages/get_it.dart';
import 'package:bot_2000/core/repository.dart';
import 'package:flutter/cupertino.dart';

class ViewModel with ChangeNotifier implements NotesLogic, UserLogic {
  final Repository _repository = getIt<Repository>();
  ViewModel() {
    getCurrentUser().then((a) => getNoteBooks());
  }
  Stream<List<NoteBook?>>? _noteBooklist;

  Stream<List<NoteBook?>>? get noteBookList => _noteBooklist;

  set noteBookList(Stream<List<NoteBook?>>? noteBook) {
    _noteBooklist = noteBook;
    notifyListeners();
  }

  User? _user;
  User? get user => _user;
  set user(User? user) {
    _user = user;
    notifyListeners();
  }

  @override
  Future<User?> getCurrentUser() async {
    user = await _repository.getCurrentUser();
  }

  @override
  Stream<List<NoteBook?>>? getNoteBooks({String? userId}) {
    noteBookList = _repository.getNoteBooks(userId: user?.userId);
    return noteBookList;
  }
}
