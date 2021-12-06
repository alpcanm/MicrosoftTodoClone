import 'dart:async';
import 'package:bot_2000/core/abstraction/notes_logic.dart';
import 'package:bot_2000/core/models/notes/note.dart';
import 'package:bot_2000/core/models/notes/note_book.dart';
import 'package:dio/dio.dart';
import 'dart:convert' as convert;

class NoteServices implements NotesLogic {
  BaseOptions baseOptions = BaseOptions();
  Dio dio = Dio();
  NoteServices() {
    baseOptions.baseUrl = 'http://127.0.0.1:5000/';
    dio.options = baseOptions;
  }

  @override
  Stream<List<NoteBook?>> getNoteBooks(String userId) {
    StreamController<List<NoteBook?>> _streamController = StreamController();
    Timer.periodic(const Duration(milliseconds: 500), (Timer t) async {
      List<NoteBook?> _noteBooks = [];
      Response response = await dio.get("/notebooks");
      List list = convert.jsonDecode(response.data);
      for (var element in list) {
        NoteBook noteBook = NoteBook.fromMap(element);
        _noteBooks.add(noteBook);
      }
      _streamController.sink.add(_noteBooks);
    });
    return _streamController.stream;
  }

  @override
  Stream<List<Note?>> getNotes(String relNoteBookId) {
    // TODO: implement getNotes
    throw UnimplementedError();
  }

  @override
  Future<bool> postNoteBook(
      {String? relationId, required String tableName}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final _now = DateTime.now().toString();
    final NoteBook _noteBook = NoteBook(
      createdAt: _now,
      isVisible: true,
      lastUpdate: _now,
      relUserId: relationId,
      text: "Yeni not defteri",
    );

    try {
      await dio.post("/notebooks", data: _noteBook.toJson());
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

  @override
  Future<bool> postNote(
      {required String relationId, required String tableName, object}) {
    // TODO: implement postNote
    throw UnimplementedError();
  }

  @override
  Future<bool> postSubNote(
      {required String relationId, required String tableName, object}) {
    // TODO: implement postSubNote
    throw UnimplementedError();
  }

  @override
  Stream<Note?> getANote(String noteId) {
    // TODO: implement getANote
    throw UnimplementedError();
  }
}
