
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class PhoneValProvider with ChangeNotifier{
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool _phoneCheck = false;
  bool get phoneCheck => _phoneCheck;

  bool _checkLoading = false;
  bool get checkLoading => _checkLoading;

  // check user exist or not
  bool _checkUser = false;
  bool get checkUser => _checkUser;

  void setPhoneCheck(val){
    _phoneCheck = val;
    notifyListeners();
  }

  void loading(val){
    _checkLoading = val;
    notifyListeners();
  }

  void checkUserLogin(){
   if( _auth.currentUser != null ){
     _checkUser = true;
   }else{
     _checkUser = false;
   }
  }
}