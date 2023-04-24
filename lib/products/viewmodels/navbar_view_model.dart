import 'package:flutter/material.dart';
import '../../core/base/base_singleton.dart';
class NavbarViewModel extends ChangeNotifier with BaseSingleton {
  int currentIndex = 0;

  void onItemTapped(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
