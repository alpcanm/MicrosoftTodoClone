import 'package:bot_2000/core/models/notes/note.dart';
import 'package:bot_2000/core/models/notes/note_book.dart';
import 'package:bot_2000/core/models/notes/sub_note.dart';
import 'dart:convert' as convert;
import 'package:flutter/services.dart';

class FakeApi {
  final List<SubNote?> subnoteList = [];
  final List<Note?> noteList = [];
  final List<NoteBook?> notebookList = [];

  getNoteBook() async {}

  Future<String> getCurrentUser() async {
    final String response = await rootBundle.loadString('fake_db/user.json');
    return response;
  }

  Future<List<NoteBook?>> getAll(String currentId) async {
    List<NoteBook?> _listNoteBook = [];
    _listNoteBook = await getNoteBooks(currentId);

    try {
      for (NoteBook? noteBook in _listNoteBook) {
        noteBook!.noteList = await getNotes(noteBook.noteBookId!);

        for (Note? note in noteBook.noteList!) {
          note!.subNotes = await getSubNotes(note.noteId!);
        }
      }
    } catch (e) {
      // print(e);
    }
    return _listNoteBook;
  }

  Future<List<NoteBook?>> getNoteBooks(String currentId) async {
    List _result = [];
    final String responseBody =
        await rootBundle.loadString('fake_db/note_book.json');
    dynamic _data = convert.jsonDecode(responseBody);
    _result = _data;
    print(_data);
    return _result
        .map((e) {
          NoteBook _data = NoteBook.fromMap(e);
          if (currentId == _data.relUserId) {
                print(_data.text);
            return _data;
          } else {
            return null;
          }
        })
        .where((element) => element == null ? false : true)
        .toList();
  }

  Future<List<Note?>> getNotes(String relNoteBookId) async {
    List _result = [];
    final String responseBody =
        await rootBundle.loadString('fake_db/note.json');
    dynamic _data = convert.jsonDecode(responseBody);
    _result = _data;

    return _result.map((e) {
      Note _data = Note.fromMap(e);
      if (_data.relNoteBookId == relNoteBookId) {
    
        return _data;
      }
    }).toList();
  }

  Future<List<SubNote?>> getSubNotes(String relNoteId) async {
    List _result = [];
    final String responseBody =
        await rootBundle.loadString('fake_db/sub_note.json');
    dynamic _data = convert.jsonDecode(responseBody);
    _result = _data;

    return _result.map((e) {
      SubNote _data = SubNote.fromMap(e);
      if (_data.relNoteId == relNoteId) {
        return _data;
      }
    }).toList();
  }
}
