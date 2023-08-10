import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nowaste_zindagi/bloc/internet_bloc/internet_bloc.dart';
import 'package:nowaste_zindagi/utils/routes/routes.dart';
import 'package:nowaste_zindagi/utils/routes/routes_name.dart';
import 'package:nowaste_zindagi/view_model/auth_view_model.dart';
import 'package:nowaste_zindagi/view_model/bottomMenu_provider.dart';
import 'package:nowaste_zindagi/view_model/provider/component_provider.dart';
import 'package:nowaste_zindagi/view_model/provider/firebase_provider.dart';
import 'package:nowaste_zindagi/view_model/validation_provider.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const NoWasteZindgi());
}

class NoWasteZindgi extends StatefulWidget {
  const NoWasteZindgi({Key? key}) : super(key: key);

  @override
  State<NoWasteZindgi> createState() => _NoWasteZindgiState();
}

class _NoWasteZindgiState extends State<NoWasteZindgi> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<InternetBloc>(create: (context)=> InternetBloc()),
        ],
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_)=> AuthViewModel()),
            ChangeNotifierProvider(create: (_)=> PhoneValProvider()),
            ChangeNotifierProvider(create: (_)=> BottomMenu()),
            ChangeNotifierProvider(create: (_) => ComponentProvider()),
            ChangeNotifierProvider(create: (_) => FirebaseProvider()),
          ],
          child: MaterialApp(
            initialRoute: RoutesName.splash,
            onGenerateRoute: Routes.generateRoutes,
          ),
        ));
  }
}
