
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nowaste_zindagi/model/userName_Model.dart';
import 'package:nowaste_zindagi/utils/utils.dart';

class FirebaseProvider extends ChangeNotifier{

  bool _checkProfileUpdate = false;
  bool get checkProfileUpdate => _checkProfileUpdate;
  bool _loading = false;
  bool get loading => _loading;

  FirebaseAuth auths =  FirebaseAuth.instance;
   DatabaseReference ref = FirebaseDatabase.instance.ref();
   String? userID;
   String? userName;

   Future<void> initializeUserID()  async {
     User? user = await auths.currentUser;
     if (user != null) {
       userID = user.uid;
       notifyListeners();
     }
   }

   Future <void> updateUser(userName, age) async{
    await ref.child("users/$userID").update({
      "username" : userName.toString(),
      "age": age.toString(),
    }).then((value) {
      Utils.toastMessages('Data Updated');
      loadingCheck(false);
    }).onError((error, stackTrace){
      loadingCheck(false);
    });
   }

   void checkProfile(val){
     _checkProfileUpdate = val;
     notifyListeners();
   }

   void loadingCheck(val){
     _loading = val;
     notifyListeners();
   }

  Future<dynamic?> getUser() async {
    try {
      DatabaseEvent data = await ref.child('users/$userID').once();
      if(data.snapshot.exists){
        if(data.snapshot.value != null){
          Map<dynamic, dynamic>? userMap = data.snapshot.value as Map?;
          UserModel dataModel = UserModel.fromJson(userMap!);
          return dataModel;
        }
      }
    } catch (e) {
      throw e;
    }
  }


}