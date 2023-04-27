import 'dart:async';

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:tuntigi/app/app_routes.dart';
import 'package:tuntigi/ui/navigators/dashboard/home.dart';
import 'package:tuntigi/ui/widgets/home/challenges_widget.dart';
import 'package:tuntigi/ui/widgets/home/dashboard_widget.dart';
import 'package:tuntigi/ui/widgets/home/news_widget.dart';
import 'package:tuntigi/ui/widgets/home/settings_widget.dart';
import 'package:tuntigi/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  final routes = ['dashboard', 'news', 'challenges', 'settings'];
  int _currentIndex = 0;

  final widgetOptions = [
    const DashboardHome(),
    const NewsWidget(),
    const ChallengesWidget(),
    const SettingsWidget()
  ];

  // @override
  // void initState() {
  //   super.initState();
  //   _currentIndex = widget.initialIndex;
  // }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        child: IndexedStack(
          index: _currentIndex,
          children: widgetOptions,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: _currentIndex == 0 ? Colors.blue : Colors.grey,
              ),
              label: "Dashboard"
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.auto_graph,
                color: _currentIndex == 1 ? Colors.blue : Colors.grey,
              ),
              label: "News"
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.rule_folder_outlined,
                color: _currentIndex == 2 ? Colors.blue : Colors.grey,
              ),
              label: "Challenges"
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color: _currentIndex == 3 ? Colors.blue : Colors.grey,
              ),
              label: "Settings"
          ),
        ],
        currentIndex: _currentIndex,
        // fixedColor: Colors.red,

        onTap: (index) {
          // Navigator.pushNamed(context, AppRoutes.appRouteRegister);
          //
          // Beamer.of(context).update(
          //   configuration: RouteInformation(
          //     location: '/?tab=${routes[index]}',
          //   ),
          //   rebuild: false,
          // );
          setState(()  => _currentIndex = index);
        },
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        selectedIconTheme: const IconThemeData(
          color: Colors.blue
        ),
        // selectedLabelStyle: TextStyle(color: Colors.red, fontSize: 20),
        // unselectedFontSize: 16,
        // selectedIconTheme:
        // const IconThemeData(color: Colors.blue, opacity: 1.0, size: 30.0),
        // unselectedItemColor: Colors.grey,
        // unselectedLabelStyle: TextStyle(color: Colors.red, fontSize: 20),
      ),
    );
  }

}