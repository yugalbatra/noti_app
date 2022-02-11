import 'package:flutter/material.dart';
import 'package:noti_app/pages/splash_page.dart';
import 'package:noti_app/sections/activities.dart';
import 'package:noti_app/sections/assessments.dart';
import 'package:noti_app/sections/home.dart';
import 'package:noti_app/sections/personal.dart';
import './assets/constants.dart';

// Widgets
import 'package:noti_app/widgets/noti_app_bar.dart';

Widget currentSection = const HomeSection();
String activeIcon = 'home';

void changeSection(String selectedSection) {
  if (selectedSection == 'assess') {
    currentSection = const AssessmentsSection();
    activeIcon = 'assess';
  } else if (selectedSection == 'activity') {
    currentSection = ActivitiesSection(
      date: date,
      activitiesSnapshot: activitiesSnapshot,
    );
    activeIcon = 'activity';
  } else if (selectedSection == 'personal') {
    currentSection = const PersonalSection();
    activeIcon = 'personal';
  } else {
    currentSection = const HomeSection();
    activeIcon = 'home';
  }
}

void main() {
  runApp(SplashPage(
      key: UniqueKey(),
      onInitializationComplete: () {
        runApp(const MyApp());
      }));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Noti',
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 90,
            shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30))),
            backgroundColor: kNotiPurple,
            elevation: 0,
            title: NotiAppBar(
              notisToday: notisToday,
            ),
          ),
          body: currentSection,
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20),
            child: Container(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: Icon(
                      Icons.dashboard,
                      color: activeIcon == 'home'
                          ? Colors.white
                          : const Color(0xff696969),
                      size: 40,
                    ),
                    onTap: () {
                      setState(() {
                        changeSection('home');
                      });
                    },
                  ),
                  GestureDetector(
                    child: Icon(
                      Icons.assignment_rounded,
                      color: activeIcon == 'assess'
                          ? Colors.white
                          : const Color(0xff696969),
                      size: 40,
                    ),
                    onTap: () {
                      setState(() {
                        changeSection('assess');
                      });
                    },
                  ),
                  GestureDetector(
                    child: Icon(
                      Icons.event_rounded,
                      color: activeIcon == 'activity'
                          ? Colors.white
                          : const Color(0xff696969),
                      size: 40,
                    ),
                    onTap: () {
                      setState(() {
                        changeSection('activity');
                      });
                    },
                  ),
                  GestureDetector(
                    child: Icon(
                      Icons.person,
                      color: activeIcon == 'personal'
                          ? Colors.white
                          : const Color(0xff696969),
                      size: 40,
                    ),
                    onTap: () {
                      setState(() {
                        changeSection('personal');
                      });
                    },
                  ),
                ],
              ),
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(50))),
            ),
          ),
        ),
      ),
    );
  }
}
