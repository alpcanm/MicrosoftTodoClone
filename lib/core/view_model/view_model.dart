import 'dart:async';

import 'package:bot_2000/core/abstraction/notes_logic.dart';
import 'package:bot_2000/core/abstraction/user_logic.dart';
import 'package:bot_2000/core/models/notes/note.dart';
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

  User? _user;
  User? get user => _user;
  set user(User? user) {
    _user = user;
    notifyListeners();
  }

  String _noteId = "";

  String get noteId => _noteId;

  set noteId(String noteId) {
    _noteId = noteId;
    notifyListeners();
  }

  @override
  Future<User?> getCurrentUser() async {
    user = await _repository.getCurrentUser();
  }

  @override
  Stream<List<NoteBook?>>? getNoteBooks({String? userId}) {
    return _repository.getNoteBooks(userId: user?.userId);
  }

  @override
  Stream<List<Note?>>? getNotes(String relNoteBookId) {
    return _repository.getNotes(relNoteBookId);
  }
}
