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
    // baseOptions.headers = {
    //   "Access-Control-Allow-Origin": "*",
    //   "Access-Control-Allow-Credentials": "true",
    //   "Access-Control-Allow-Headers":
    //       "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
    //   "Access-Control-Allow-Methods": "GET,POST, OPTIONS"
    // };
    dio.options = baseOptions;
  }
  @override
  Stream<List<NoteBook?>> getNoteBooks(String userId) {
    // TODO: implement getNoteBooks
    throw UnimplementedError();
  }

  @override
  Stream<List<Note?>>? getNotes(String relNoteBookId) {
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
      //await dio.post("/notebooks", data: _noteBook.toJson());
      Response response = await dio.get("/notebooks");
      List list = convert.jsonDecode(response.data);
      List<NoteBook> _noteList = [];
      for (var element in list) {
        NoteBook noteBook = NoteBook.fromMap(element);
        print(noteBook.text);
        _noteList.add(noteBook);
      }
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
}
