import 'package:bot_2000/core/models/notes/note.dart';
import 'package:bot_2000/core/models/notes/note_book.dart';
import 'package:bot_2000/core/models/notes/sub_note.dart';
import 'package:bot_2000/core/models/user.dart';

class FakeUser {
  static User? user = User(
    name: "Alp Can",
    mail: "alpcanm@gmail.com",
    id: "1",
    creatadAt: "2.12.2021",
    phoneNumber: "537 440 2121",
  );
}

class FakeNoteBooks {
  static NoteBook? noteBook1 = NoteBook(
    noteBookId: "1",
    relUserId: "1",
    text: "NoteBook Title1",
  );
  static NoteBook? noteBook2 = NoteBook(
    noteBookId: "2",
    relUserId: "1",
    text: "NoteBook Title2222",
  );
  static NoteBook? noteBook3 = NoteBook(
    noteBookId: "3",
    relUserId: "1",
    text: "NoteBook Title33",
  );
  static NoteBook? noteBook4 = NoteBook(
    noteBookId: "4",
    relUserId: "1",
    text: "NoteBook Title44",
  );
}

class FakeNotes {
  static Note? note1 = Note(
    comment: "Comment",
    isComplete: false,
    isMajor: false,
    relNoteBookId: "1",
    noteId: "1",
    text: "note title123",
  );
  static Note? note2 = Note(
    comment: "Comment",
    isComplete: false,
    isMajor: false,
    relNoteBookId: "1",
    noteId: "2",
    text: "note title3213",
  );
  static Note? note3 = Note(
    comment: "Comment",
    isComplete: false,
    isMajor: false,
    relNoteBookId: "2",
    noteId: "3",
    text: "note title22222",
  );
  static Note? note4 = Note(
    comment: "Comment",
    isComplete: false,
    isMajor: false,
    relNoteBookId: "3",
    noteId: "4",
    text: "note title333333",
  );
  static Note? note5 = Note(
    comment: "Comment",
    isComplete: false,
    isMajor: false,
    relNoteBookId: "3",
    noteId: "5",
    text: "note title444444",
  );
}

class FakeSubNotes {
  static SubNote? subNote1 = SubNote(
    isComplete: false,
    relNoteId: "1",
    text: "sub note 1",
    subNoteId: "1",
  );
  static SubNote? subNote2 = SubNote(
    isComplete: false,
    relNoteId: "1",
    text: "sub note 11122",
    subNoteId: "2",
  );
  static SubNote? subNote3 = SubNote(
    isComplete: false,
    relNoteId: "2",
    text: "sub note 222122",
    subNoteId: "3",
  );
  static SubNote? subNote4 = SubNote(
    isComplete: false,
    relNoteId: "2",
    text: "sub note 22222",
    subNoteId: "4",
  );
  static SubNote? subNote5 = SubNote(
    isComplete: false,
    relNoteId: "2",
    text: "sub note 223333",
    subNoteId: "5",
  );
  static SubNote? subNote6 = SubNote(
    isComplete: false,
    relNoteId: "4",
    text: "sub note 444444",
    subNoteId: "6",
  );
  static SubNote? subNote7 = SubNote(
    isComplete: false,
    relNoteId: "4",
    text: "sub note 4445555",
    subNoteId: "7",
  );
  static SubNote? subNote8 = SubNote(
    isComplete: false,
    relNoteId: "5",
    text: "sub note 5555566666",
    subNoteId: "8",
  );
  static SubNote? subNote9 = SubNote(
    isComplete: false,
    relNoteId: "5",
    text: "sub note 66666555",
    subNoteId: "9",
  );
}
