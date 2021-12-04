import 'package:bot_2000/core/models/notes/note.dart';
import 'package:flutter/cupertino.dart';

class NoteViewModel with ChangeNotifier {
  Note? _currentNote;
  Note? get currentNote => _currentNote;
  set currentNote(Note? currentNote) {
    _currentNote = currentNote;
    notifyListeners();
  }
}
