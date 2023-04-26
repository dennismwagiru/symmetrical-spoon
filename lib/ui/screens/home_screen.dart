import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tuntigi/app/app_routes.dart';
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
  int selectedIndex = 0;

  final widgetOptions = [
    const DashboardWidget(),
    const NewsWidget(),
    const ChallengesWidget(),
    const SettingsWidget()
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final widgetTitle = ['Dashboard', 'News', 'Challenges', 'Settings'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: widgetOptions.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: selectedIndex == 0 ? Colors.blue : Colors.grey,
              ),
              label: "Dashboard"
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.auto_graph,
                color: selectedIndex == 1 ? Colors.blue : Colors.grey,
              ),
              label: "News"
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.rule_folder_outlined,
                color: selectedIndex == 2 ? Colors.blue : Colors.grey,
              ),
              label: "Challenges"
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color: selectedIndex == 3 ? Colors.blue : Colors.grey,
              ),
              label: "Settings"
          ),
        ],
        currentIndex: selectedIndex,
        // fixedColor: Colors.red,

        onTap: onItemTapped,
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