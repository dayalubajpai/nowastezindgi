import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nowaste_zindagi/utils/routes/routes_name.dart';
import 'package:nowaste_zindagi/view/home_screen.dart';
import 'package:nowaste_zindagi/view/login_screen.dart';
import 'package:nowaste_zindagi/view/otp_screen.dart';
import 'package:nowaste_zindagi/view/profile/update_profile.dart';
import 'package:nowaste_zindagi/view/splash/splash_screen.dart';

import '../../res/components/buttonComponent/bottom_button.dart';

class Routes{
 static MaterialPageRoute generateRoutes(RouteSettings settings){
  switch(settings.name){
    case RoutesName.home:
      return MaterialPageRoute(builder: (context) => HomeScreen());
    case RoutesName.login:
      return MaterialPageRoute(builder: (context)=> LoginScreen());
    case RoutesName.otp:
      return MaterialPageRoute(builder: (context) => OtpScreen(data: settings.arguments as Map));
    case RoutesName.splash:
      return MaterialPageRoute(builder: (context)=> SplashScreen());
    case RoutesName.bottomMenu:
      return MaterialPageRoute(builder: (context)=> BottomNavigationAp());
    case RoutesName.updateProfile:
      return MaterialPageRoute(builder: (context) => UpdateProfile());
    default:
      return MaterialPageRoute(builder: (_) => Scaffold(
        body: Text('Page Not Found'),
      ) );
  }
 }
}