import 'package:bot_2000/core/models/notes/note.dart';
import 'package:bot_2000/core/models/notes/note_book.dart';
import 'package:bot_2000/core/models/notes/sub_note.dart';
import 'package:bot_2000/core/models/user.dart';

class FakeDB {
  SubNote? subNote1;
  Note? note;
  final List<SubNote?> _subnoteList=[];
  final List<Note?> _noteList=[];
  final List<NoteBook?> notebookList=[];
  NoteBook? noteBook;
  User? user;
  FakeDB() {
    subNote1 = SubNote(
      isComplete: false,
      relNoteId: "1",
      text: "sub note 1",
      subNoteId: "1",
    );
    _subnoteList.add(subNote1);
    note = Note(
      comment: "Comment",
      isComplete: false,
      isMajor: false,
      relNoteBookId: "1",
      noteId: "1",
      text: "note title",
    );
    _noteList.add(note);

    noteBook = NoteBook(
      noteBookId: "1",
      relUserId: "1",
      text: "NoteBook Title",
    );
    notebookList.add(noteBook);
    
    user = User(
        name: "Alp Can",
        mail: "alpcanm@gmail.com",
        id: "1561321",
        creatadAt: "2.12.2021",
        phoneNumber: "537 440 2121",
        surname: "Marangoz");
  }
}
