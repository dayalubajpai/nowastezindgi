import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nowaste_zindagi/repository/auth_repository.dart';
import 'package:nowaste_zindagi/utils/utils.dart';

import '../utils/routes/routes_name.dart';

class AuthViewModel with ChangeNotifier{
  final _myRepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }
  Future<void> loginApi(dynamic data, BuildContext context) async{
    setLoading(true);
    _myRepo.loginApi(data).then((value) => {
      Utils.flashBarMessage(flushbar: "Login Sucessful",color: Colors.green, context: context),
      Navigator.pushReplacementNamed(context, RoutesName.home),
      setLoading(false),
      print(value.toString())
    }).onError((error, stackTrace) => {
    setLoading(false),
    Utils.flashBarMessage(color : Colors.red, context: context, flushbar: 'Login Error')
    });
  }
}