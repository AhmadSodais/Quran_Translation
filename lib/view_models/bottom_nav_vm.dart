import 'package:flutter/material.dart';
import 'package:quran_translation/views/audio.dart';
import 'package:quran_translation/views/home.dart';
import 'package:quran_translation/views/quran/quran.dart';
import 'package:quran_translation/views/setting.dart';

class BottomNavViewModel extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  List screens = [HomeScreen(), QuranScreen(), AudioScreen(), SettingScreen()];
  List<String> screensTitles = [
    "home",
    "quran",
    "audio",
    "settings"
  ];

  void setIndex(int index) {
    if (_currentIndex != index) {
      _currentIndex = index;
      notifyListeners();
    }
  }

  operator [](int other) {}

}
