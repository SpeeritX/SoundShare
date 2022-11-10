import 'package:flutter/cupertino.dart';

class PlayerController extends ChangeNotifier {
  //TODO
  // List<Song>;
  String currentSong = "";

  void init() {
    notifyListeners();
  }
}
