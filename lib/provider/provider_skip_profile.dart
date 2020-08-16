import 'package:flutter/material.dart';

class UserSkip with ChangeNotifier {
  bool isSkipped = false;

  void checkIfSkipped() {
    isSkipped = true;
    notifyListeners();
  }
}
