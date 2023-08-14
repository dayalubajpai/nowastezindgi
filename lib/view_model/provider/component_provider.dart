import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ComponentProvider  extends ChangeNotifier{


  Timer? _timer;
  int? _tickValue = 1;
  Color? _color;
  int _days = 0;
  int _hours = 0;
  int _minutes = 0;
  int _seconds = 0;
  double _progressBar = 0;
  String? _reset;
  int? get tickValue => _tickValue;
  int? get days => _days;
  int? get hours => _hours;
  int? get seconds => _seconds;
  Color? get color => _color;
  int? get minutes => _minutes;
  String? get reset => _reset;
  double get progressBar => _progressBar;

  Future<DateTime> getTime() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final newDate = prefs.getString('newDate');
    if(newDate != null){
      return DateTime.parse(newDate);
    }else{
      return DateTime.now();
    }
  }

  addStringToSF(value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if((await getStringFromSF())['oldDate']  == 0){
      prefs.setString('newDate', value);
    }else{
       dynamic newVal = (await getStringFromSF())['newDate'];
      prefs.setString('oldDate', newVal);
      prefs.setString('newDate', value);
    }
  }

  Future<Map<String, dynamic>> getStringFromSF() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> val = {"oldDate" : "${await prefs.getString('oldDate') ?? 0}", "newDate" : "${await prefs.getString('newDate') ?? 0}"};
    return val;
  }

  void startCounter(val) async{
      _timer?.cancel();
    dynamic x = await getStringFromSF();
      if(x['newDate'] != '0' || val == 1){
          _color = Colors.redAccent;
          _reset = "Reset";
        _timer = Timer.periodic(Duration(seconds: 1), (timer) {

          DateTime oldDate = DateTime.parse(x['newDate']);
          DateTime newDate = DateTime.now();
          Duration difference = newDate.difference(oldDate);
          _days = difference.inDays;
          _hours = difference.inHours % 24;
          _minutes = difference.inMinutes % 60;
          _seconds = difference.inSeconds % 60;
          _progressBar = _days/150;
          // _tickValue = timer.tick;
          notifyListeners(); // Notify listeners about the change in tick value
        });
      }
  }

  setTime() async{
    addStringToSF(DateTime.now().toString());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(DateTime.now().toString());
    prefs.setString('newDate', DateTime.now().toString());
    // prefs.setString('newDate','2023-04-14 15:47:40.200175');
     startCounter(1);
  }
}
