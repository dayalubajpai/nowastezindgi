import 'package:flutter/cupertino.dart';

class BottomMenu extends ChangeNotifier{
  var _widgetIndex = 0;
  int get widgetIndex  => _widgetIndex;

  void setIndex(int index){
    _widgetIndex = index;
    notifyListeners();
  }
}