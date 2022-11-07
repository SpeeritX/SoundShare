import 'package:flutter/cupertino.dart';

class PlayerController extends ChangeNotifier {
  //TODO
  String currentSong = "";

  void init() {
    notifyListeners();
  }
}
