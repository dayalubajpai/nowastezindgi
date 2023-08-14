import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nowaste_zindagi/utils/routes/routes_name.dart';
import 'package:nowaste_zindagi/view_model/provider/component_provider.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';
import '../res/components/textStyle.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        width: MediaQuery.of(context).size.width * 100,
        child: SafeArea(
          bottom: false,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Row(
                    children: [
                      const Icon(Icons.arrow_back),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        "Go Back",
                        style: TextStyles.subheading
                            .copyWith(fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Expanded(child: Center(child: Text('No Notification')))
          ]),
        ),
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 10.0),
            child: Column(
              children: [
                const Text('No Waste', style: TextStyle(fontSize: 12)),
                const Text(
                  'Zindgi',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.redAccent),
                ),
                const SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.updateProfile);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 18.0, top: 10.0, bottom: 10.0),
                    child: Row(
                      children: [
                        Text(
                          "Profile",
                          style: TextStyles.subheading
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        const Icon(Icons.arrow_right_sharp),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 18.0, top: 10.0, bottom: 10.0),
                    child: Row(
                      children: [
                        Text(
                          "NoFap E-Book",
                          style: TextStyles.subheading
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        const Icon(Icons.arrow_right_sharp),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                GestureDetector(
                  onTap: () {
                    auth.signOut();
                    Navigator.pushReplacementNamed(context, RoutesName.login);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 18.0, top: 10.0, bottom: 10.0),
                    child: Row(
                      children: [
                        Text(
                          "Logout",
                          style: TextStyles.subheading
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        const Icon(Icons.arrow_right_sharp),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 60,),

              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.black87,
              ));
        }),
        actions: [
          Builder(
              builder: (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  icon: const Icon(Icons.notifications_active_outlined,
                      color: Colors.black87)))
        ],
        title: const Text(
          'Home',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    context.read<ComponentProvider>().startCounter(0);
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      children: [
        const SizedBox(
          height: 30,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 0.0),
                spreadRadius: 0.001,
                blurRadius: 0.1,
              ),
            ],
          ),
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child:
                  Consumer<ComponentProvider>(builder: (context, value, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text('${value.days} Days',
                        style: TextStyles.heading.copyWith(fontSize: 32)),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      '${value.hours} Hours, ${value.minutes} Minutes,  ${value.seconds} Seconds',
                      style: TextStyles.extrasmallTxt,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text("${(value.progressBar*100).round()}% Builded",
                        style: TextStyles.smallText.copyWith(
                          fontWeight: FontWeight.w600,
                        )),
                    const SizedBox(
                      height: 10.0,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: LinearProgressIndicator(
                        minHeight: 10.0,
                        backgroundColor: Colors.black12,
                        valueColor:
                            new AlwaysStoppedAnimation<Color>( (value.progressBar*100).round() > 50 ? Colors.green : Colors.redAccent),
                        value: value.progressBar,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.35,
                          height: 70,
                          //TODO : start button
                          child: ElevatedButton(
                            onPressed: () {
                              value.setTime();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: value.color ?? Colors.green,
                              elevation: 0.0,
                              shadowColor: Colors.black54.withOpacity(0.2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: Text(value.reset ?? "Start",
                                style: TextStyles.subheading.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400)),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(10.0)),
                          width: MediaQuery.of(context).size.width * 0.35,
                          height: 70,
                          child: const Center(
                              child: Text(
                            "150 Days \n Goal",
                            style: TextStyle(
                                height: 1.4, fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,
                          )),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ],
                );
              })),
        ),
        SizedBox(
          height: 20.0,
        ),
        SizedBox(
          height: 370,
          child:FutureBuilder(
            future: context.read<ComponentProvider>().getTime(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done ||
                  snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  CleanCalendarController calendarController = CleanCalendarController(
                    minDate: snapshot.data ?? DateTime.now(),
                    maxDate: DateTime.now(), // Use the calculated maxDate here
                  );
                  return ScrollableCleanCalendar(
                    calendarController: calendarController,
                    layout: Layout.DEFAULT,
                    daySelectedBackgroundColorBetween: Colors.cyan,
                    dayBackgroundColor: Colors.cyan.shade50,
                    daySelectedBackgroundColor: Colors.cyan,
                    dayTextStyle: TextStyle(
                      fontSize: 12,
                    ),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          )

        ),
      ],
    );
  }
}
