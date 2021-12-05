import 'package:bot_2000/core/abstraction/notes_logic.dart';
import 'package:bot_2000/core/models/notes/note.dart';
import 'package:bot_2000/core/models/notes/note_book.dart';
import 'package:dio/dio.dart';

class NoteServices implements NotesLogic {
  BaseOptions baseOptions = BaseOptions();
  Dio dio = Dio();
  NoteServices() {
    baseOptions.baseUrl = 'https://api.frankfurter.app/';
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
  Future<bool> postObject(
      {String? relationId, required String tableName, object}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    List<String> currencies = [];
    Response _response = await dio.get("path");
    if (_response.statusCode == 200) {
      (_response.data as Map).forEach((key, value) {
        currencies.add(key);
      });
    }
    print(currencies);
    return true;
  }

  @override
  Future<bool> updateField(
      {String? relationId, required String tableName, required field}) {
    // TODO: implement updateText
    throw UnimplementedError();
  }
}
