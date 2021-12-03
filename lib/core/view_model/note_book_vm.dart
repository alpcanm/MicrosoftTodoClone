import 'package:bot_2000/core/abstraction/notes_logic.dart';
import 'package:bot_2000/core/models/notes/note_book.dart';
import 'package:bot_2000/core/packages/get_it.dart';
import 'package:bot_2000/core/repository.dart';
import 'package:flutter/cupertino.dart';

class NoteBookVM with ChangeNotifier implements NotesLogic {
  final Repository _repository = getIt<Repository>();
  NoteBookVM() {
    getNoteBooks();
  }

  @override
  Stream<List<NoteBook?>> getNoteBooks() {
    return _repository.getNoteBooks();
  }
}
