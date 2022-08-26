import 'package:flutter/cupertino.dart';

class SectionProvider with ChangeNotifier {
  String sectionId = "";

  void setSectionId(String id) {
    sectionId = id;
    notifyListeners();
  }
}
