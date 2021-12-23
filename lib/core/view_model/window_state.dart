import 'package:flutter/material.dart';

class WindowState with ChangeNotifier {

  bool _firstWindowOpen = false;
  bool get firstWindowOpen => _firstWindowOpen;
  set firstWindowOpen(bool value) {
    _firstWindowOpen = value;
    notifyListeners();
  }
  

  bool _secondWindowOpen = false;
  bool get secondWindowOpen => _secondWindowOpen;
  set secondWindowOpen(bool value) {
    _secondWindowOpen = value;
    notifyListeners();
  }

}
