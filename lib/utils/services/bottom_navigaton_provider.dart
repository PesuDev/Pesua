import 'package:flutter/cupertino.dart';

class BottomNavigationProvider extends ChangeNotifier{
  int selectedIndex=0;

  void selectBottomIndex({required int bottomIndex}){
    selectedIndex=bottomIndex;
    notifyListeners();
  }
}