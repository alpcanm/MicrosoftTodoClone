import 'dart:async';
import 'package:bot_2000/core/abstraction/notes_logic.dart';
import 'package:bot_2000/core/keys.dart';
import 'package:bot_2000/core/models/notes/note.dart';
import 'package:bot_2000/core/models/notes/note_book.dart';
import 'package:bot_2000/core/models/notes/sub_note.dart';
import 'package:bot_2000/core/config_const.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

String? shortString(String? text) {
  return text?.substring((text.length / 2).floor());
}

class NoteServices implements NotesLogic {
  final BaseOptions _baseOptions = BaseOptions();
  final Dio _dio = Dio();
  NoteServices() {
    _baseOptions.baseUrl = NetworkConfig.baseUrl;
    _dio.options = _baseOptions;
  }
  List<Note?> _notes = [];
  int notebookListLength = 0;
  int noteListLengt = 0;

  @override
  Stream<List<NoteBook?>> getNoteBooks(String userId) async* {
    try {
      while (true) {
        await Future.delayed(const Duration(milliseconds: 500));
        List<NoteBook?> _noteBooks = [];
        Response _response = await _dio.get('/${Keys.tableNotebooks}',
            queryParameters: {'rel_id': shortString(userId)});
        List list = _response.data;
        for (var element in list) {
          NoteBook noteBook = NoteBook.fromMap(element);
          _noteBooks.add(noteBook);
        }
        notebookListLength = _noteBooks.length;
        yield _noteBooks;
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<bool> postNoteBook({String? relationId, required int sequence}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final DateTime _now = DateTime.now();
    final NoteBook _noteBook = NoteBook(
        createdAt: _now,
        isVisible: true,
        lastUpdate: _now,
        relUserId: shortString(relationId),
        text: 'Yeni not defteri',
        iconData: '',
        noteBookId: '',
        sequence: sequence);
    try {
      print(_noteBook.relUserId);
      await _dio.post('/${Keys.tableNotebooks}', data: _noteBook.toJson());
      return true;
    } catch (e) {
      print(e);

      return false;
    }
  }

  @override
  Stream<List<Note?>> getNotes(String relNoteBookId) async* {
    try {
      while (true) {
        await Future.delayed(const Duration(milliseconds: 500));
        Response _response = await _dio.get('/${Keys.tableNotes}/',
            queryParameters: {'rel_id': shortString(relNoteBookId)});
        List _list = _response.data;
        _notes = _list.map((e) {
          Note _note = Note.fromMap(e);
          return _note;
        }).toList();
        noteListLengt = _notes.length;
        yield _notes;
      }
    } catch (e) {
      print(e);

      rethrow;
    }
  }

  @override
  Future<bool> postNote(
      {required String relationId,
      required String text,
      required int sequence}) async {
    final DateTime _now = DateTime.now();
    final Note _note = Note(
        noteId: '',
        createdAt: _now,
        isVisible: true,
        lastUpdate: _now,
        relNoteBookId: shortString(relationId),
        text: text,
        isComplete: false,
        comment: 'Bir yorum ekle.',
        isMajor: false,
        sequence: sequence);
    try {
      await _dio.post('/${Keys.tableNotes}', data: _note.toJson());
      return true;
    } catch (e) {
      print(e);

      return false;
    }
  }

  @override
  Stream<Note?> getANote(String noteId) async* {
    try {
      while (true) {
        await Future.delayed(const Duration(milliseconds: 500));
        Note? _note = _notes
            .where((element) => element?.noteId == noteId ? true : false)
            .toList()
            .first;
        Response _response = await _dio.get('/${Keys.tableSubnotes}',
            queryParameters: {'rel_id': shortString(noteId)});
        List _list = _response.data;
        List<SubNote> _subNoteList = _list.map((e) {
          SubNote _subnote = SubNote.fromMap(e);
          return _subnote;
        }).toList();
        _note?.subNotes = _subNoteList;
        yield _note;
      }
    } catch (e) {
      print(e);

      rethrow;
    }
  }

  @override
  Future<bool> postSubNote(
      {required String relationId,
      required String text,
      required int sequence}) async {
    final _now = DateTime.now();
    SubNote _subNote = SubNote(
        createdAt: _now,
        isComplete: false,
        isVisible: true,
        relNoteId: shortString(relationId),
        sequence: sequence,
        subNoteId: '',
        text: text);
    try {
      await _dio.post('/${Keys.tableSubnotes}', data: _subNote.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> updateField(
      {required String relationId,
      required String tableName,
      required value,
      required String columnName}) async {
    Map _data = {columnName: value};
    try {
      await _dio.patch('$tableName/$relationId', data: jsonEncode(_data));
      return true;
    } catch (e) {
      return false;
    }
  }
}
