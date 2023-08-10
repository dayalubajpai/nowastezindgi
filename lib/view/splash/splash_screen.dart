import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nowaste_zindagi/utils/routes/routes_name.dart';
import 'package:nowaste_zindagi/view_model/provider/firebase_provider.dart';
import 'package:nowaste_zindagi/view_model/validation_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PhoneValProvider>(builder: (context, splash, child){
      splash.checkUserLogin();
      Future.delayed(Duration(seconds: 3)).then((value) {
       if(splash.checkUser){
         Navigator.pushReplacementNamed(context, RoutesName.bottomMenu);
       }else{
         Navigator.pushReplacementNamed(context, RoutesName.login);
       }
      });
      return Scaffold(
        body: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('No Waste', style: TextStyle(fontSize: 12)),
            Text('Zindgi',style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.redAccent),),
          ],
        )),
      );
    });
  }
}
