import 'package:flutter/material.dart';

class ItemProvider with ChangeNotifier {
  String itemId = "";
  Offset ofsetPosition = const Offset(0, 0);
  bool choosed = false;

  void setItemId(String id, Offset offset) {
    choosed = true;
    itemId = id;
    ofsetPosition = offset;
    notifyListeners();
  }

  void removeCard() {
    choosed = false;
    itemId = "";

    notifyListeners();
  }
}
