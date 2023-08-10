import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ComponentProvider  extends ChangeNotifier{


  addStringToSF(value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('oldDate', value);
  }

  void setTime(){
    DateTime now = DateTime.now();
    addStringToSF(now);
    int year = now.year;
    int month = now.month;
    int day = now.day;
    int hours = now.hour;
    int minutes = now.minute;
    DateTime storedDateTime = DateTime(year, month, day, hours, minutes); // Replace with your stored date-time value
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      DateTime currentTime = DateTime.now();
      Duration difference = currentTime.difference(storedDateTime);

      int days = difference.inDays;
      int hours = difference.inHours.remainder(24);
      int minutes = difference.inMinutes.remainder(60);
      int seconds = difference.inSeconds.remainder(60);

      print("Time Difference: $days days, $hours hours, $minutes minutes, $seconds seconds");
    });
  }
}