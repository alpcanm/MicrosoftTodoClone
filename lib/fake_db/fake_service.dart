import 'dart:async';
import 'package:bot_2000/core/models/notes/note_book.dart';
import 'package:bot_2000/core/models/user.dart';
import 'package:bot_2000/core/packages/get_it.dart';
import 'package:bot_2000/fake_db/fake_api.dart';

class FakeService {
  final FakeApi _fakeApi = getIt<FakeApi>();

  User? _user;
  Future<User?> getCurrentUser() async {
    String response = await _fakeApi.getCurrentUser();
    _user = User.fromJson(response);
    return _user;
  }

  Stream<List<NoteBook?>>? getNoteBooks({String? userId}) {
    List<NoteBook?> noteBooks;

    Stream<List<NoteBook?>> _fakeNotebooks(bool isTrue, String id) async* {
      while (isTrue) {
        await Future.delayed(const Duration(milliseconds: 1000));

        noteBooks = await _fakeApi.getAll(id);
        ;

        yield noteBooks;
      }
    }

    if (userId != null) {
      print("b");
      return _fakeNotebooks(true, userId);
    } else {
      print("a");
      return null;
    }
  }
}
