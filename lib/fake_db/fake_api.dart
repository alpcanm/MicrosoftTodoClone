import 'package:bot_2000/core/models/notes/note.dart';
import 'package:bot_2000/core/models/notes/note_book.dart';
import 'package:bot_2000/core/models/notes/sub_note.dart';
import 'dart:convert' as convert;
import 'package:flutter/services.dart';

class FakeApi {
  final List<Note?> noteList = [];
  final List<NoteBook?> notebookList = [];

  getNoteBook() async {}

  Future<String> getCurrentUser() async {
    final String response = await rootBundle.loadString('fake_db/user.json');
    return response;
  }

  Future<List<NoteBook?>> getNoteBooks(String currentId) async {
    List _noteBooklist = [];

    final String responseBody =
        await rootBundle.loadString('fake_db/note_book.json');
    dynamic _data = convert.jsonDecode(responseBody);
    _noteBooklist = _data;

    List<NoteBook?> dyno = _noteBooklist
        .map((e) {
          NoteBook _data = NoteBook.fromMap(e);
          if (currentId == _data.relUserId) {
            return _data;
          } else {
            return null;
          }
        })
        .where((element) => element == null ? false : true)
        .toList();

    return dyno;
  }

  Future<List<Note?>> getAllNotes(String relNoteBookId) async {
   // print(relNoteBookId);
    List<Note?> _result = [];
    _result = await getNotes(relNoteBookId);

    for (Note? element in _result) {
      element!.subNotes = await getSubNotes(element.noteId!);
    }

    return _result;
  }

  Future<List<Note?>> getNotes(String relNoteBookId) async {
    List _result = [];
    final String responseBody =
        await rootBundle.loadString('fake_db/note.json');
    dynamic _data = convert.jsonDecode(responseBody);
    _result = _data;

    return _result
        .map((e) {
          Note _data = Note.fromMap(e);
          if (_data.relNoteBookId == relNoteBookId) {
            return _data;
          }
        })
        .where((element) => element == null ? false : true)
        .toList();
  }

  Future<List<SubNote?>> getSubNotes(String relNoteId) async {
    List _result = [];
    final String responseBody =
        await rootBundle.loadString('fake_db/sub_note.json');
    dynamic _data = convert.jsonDecode(responseBody);
    _result = _data;

    return _result
        .map((e) {
          SubNote _data = SubNote.fromMap(e);
          if (_data.relNoteId == relNoteId) {
            return _data;
          }
        })
        .where((element) => element == null ? false : true)
        .toList();
  }
}
