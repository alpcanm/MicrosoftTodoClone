import 'package:bot_2000/core/models/notes/note_book.dart';

abstract class NotesLogic {
  Stream<List<NoteBook?>> getNoteBooks();
}
