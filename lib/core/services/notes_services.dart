import 'dart:async';
import 'package:bot_2000/core/abstraction/notes_logic.dart';
import 'package:bot_2000/core/models/notes/note.dart';
import 'package:bot_2000/core/models/notes/note_book.dart';
import 'package:bot_2000/core/models/notes/sub_note.dart';
import 'package:dio/dio.dart';

class NoteServices implements NotesLogic {
  final BaseOptions _baseOptions = BaseOptions();
  final Dio _dio = Dio();
  NoteServices() {
    _baseOptions.baseUrl = 'http://127.0.0.1:5000/';
    _dio.options = _baseOptions;
  }
  List<Note?> _notes = [];
  @override
  Stream<List<NoteBook?>> getNoteBooks(String userId) {
    StreamController<List<NoteBook?>> _streamController = StreamController();
    try {
      Timer.periodic(const Duration(milliseconds: 2000), (Timer t) async {
        List<NoteBook?> _noteBooks = [];
        Response _response = await _dio.get('/notebooks/$userId');
        List list = _response.data;

        for (var element in list) {
          NoteBook noteBook = NoteBook.fromMap(element);

          _noteBooks.add(noteBook);
        }
        _streamController.sink.add(_noteBooks);
      });
    } catch (e) {
      print(e);
    }
    return _streamController.stream;
  }

  @override
  Future<bool> postNoteBook(
      {String? relationId, required String tableName}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final DateTime _now = DateTime.now();
    final NoteBook _noteBook = NoteBook(
        createdAt: _now,
        isVisible: true,
        lastUpdate: _now,
        relUserId: relationId,
        text: 'Yeni not defteri',
        iconData: "",
        noteBookId: "",
        sequence: 1);

    try {
      await _dio.post('/notebooks', data: _noteBook.toJson());
    } on DioError catch (e) {
      print(e.message);
    }
    return true;
  }

  @override
  Stream<List<Note?>> getNotes(String relNoteBookId) async* {
    try {
      while (true) {
        await Future.delayed(const Duration(milliseconds: 500));
        Response _response = await _dio.get('/notes/$relNoteBookId');
        List _list = _response.data;
        _notes = _list.map((e) {
          Note _note = Note.fromMap(e);
          return _note;
        }).toList();

        yield _notes;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<bool> postNote(
      {required String relationId, required String text}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final DateTime _now = DateTime.now();
    final Note _note = Note(
        noteId: "",
        createdAt: _now,
        isVisible: true,
        lastUpdate: _now,
        relNoteBookId: relationId,
        text: text,
        isComplete: false,
        comment: "Bir yorum ekle.",
        isMajor: false,
        sequence: 1);

    try {
      await _dio.post('/notes', data: _note.toJson());
    } on DioError catch (e) {
      print(e.message);
    }
    return true;
  }

  @override
  Stream<Note?> getANote(String noteId) async* {
    try {
      while (true) {
        await Future.delayed(const Duration(milliseconds: 500));
        Note? _note = _notes
            .where((element) => element!.noteId == noteId ? true : false)
            .toList()
            .first;
        await Future.delayed(const Duration(milliseconds: 500));
        Response _response = await _dio.get('/subnotes/$noteId');
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
    }
  }

  @override
  Future<bool> postSubNote(
      {required String relationId, required String text}) async {
    final _now = DateTime.now();
    SubNote _subNote = SubNote(
        createdAt: _now,
        isComplete: false,
        isVisible: true,
        relNoteId: relationId,
        sequence: 2,
        subNoteId: "",
        text: text);
    try {
      await _dio.post('/subnotes', data: _subNote.toJson());
    } on DioError catch (e) {
      print(e.message);
    }
    return true;
  }

  @override
  Future<bool> updateField(
      {String? relationId, required String tableName, required field}) {
    // TODO: implement updateText
    throw UnimplementedError();
  }
}
