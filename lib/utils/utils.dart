import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{
 static toastMessages(String msg){
    Fluttertoast.showToast(msg: msg,
    backgroundColor: Colors.red,
    );
  }
  static flashBarMessage({required String flushbar, Color color = Colors.black54, required BuildContext context}){
   showFlushbar(context: context, flushbar: Flushbar(
     message: flushbar,
     backgroundColor: color,
     duration: Duration(seconds: 3),
   )..show(context)
   );
  }


}