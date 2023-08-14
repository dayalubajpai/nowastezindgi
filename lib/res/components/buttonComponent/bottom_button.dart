import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nowaste_zindagi/view/home_screen.dart';
import 'package:provider/provider.dart';
import '../../../bloc/internet_bloc/internet_bloc.dart';
import '../../../bloc/internet_bloc/internet_state.dart';
import '../../../utils/utils.dart';
import '../../../view/chat_screen.dart';
import '../../../view/profile/update_profile.dart';
import '../../../view/webview_instagram.dart';
import '../../../view_model/bottomMenu_provider.dart';

class BottomNavigationAp extends StatelessWidget {
  const BottomNavigationAp({Key? key}) : super(key: key);
  static final List<Widget> _WidgetOption =<Widget>[
    HomeScreen(),
    InstagramPost(),
    ChatScreen(),
    UpdateProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    final bottomProvider = Provider.of<BottomMenu>(context);
    return BlocConsumer<InternetBloc, InternetState>(builder: (context, state){
      return Scaffold(
        body: Consumer<BottomMenu>(builder: (context, value, child){
          return _WidgetOption[value.widgetIndex];
        }),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: bottomProvider.widgetIndex,
          onTap: bottomProvider.setIndex,
          elevation: 10,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.blueGrey,
          unselectedItemColor: Colors.blueGrey.shade300,
          items: const [
            BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
                activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
                label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.feed_outlined),
                activeIcon: Icon(Icons.feed),
                label: "Feed"),
            BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_chat_regular),
                activeIcon: Icon(FluentSystemIcons.ic_fluent_chat_filled),
                label: "Chat"),
            BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
                activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
                label: "Profile"),
          ],
        ),
      );
    }, listener: (context, state){
      if(state is InternetLostState ){
        Utils.flashBarMessage(flushbar: 'Internet Lost', context: context, color: Colors.redAccent);
      }else{
        Utils.flashBarMessage(flushbar: 'Internet Connected', context: context, color: Colors.green);
      }
    });
  }
}
