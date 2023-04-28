import 'package:flutter/material.dart';
import 'package:tuntigi/app/app_routes.dart';

final routes = [
  AppRoutes.appRouteDashboard,
  AppRoutes.appRouteNews,
  AppRoutes.appRouteChallenges,
  AppRoutes.appRouteSettings
];

class BottomNavBar extends StatelessWidget {
  final int index;
  const BottomNavBar({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: index == 0 ? Colors.blue : Colors.grey,
              size: 26,
            ),
            label: "Dashboard"
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.auto_graph,
              color: index == 1 ? Colors.blue : Colors.grey,
              size: 26,
            ),
            label: "News"
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.rule_folder_outlined,
              color: index == 2 ? Colors.blue : Colors.grey,
              size: 26,
            ),
            label: "Challenges"
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: index == 3 ? Colors.blue : Colors.grey,
              size: 26,
            ),
            label: "Settings"
        ),
      ],
      currentIndex: index,
      // fixedColor: Colors.red,

      onTap: (index) {
        Navigator.pushReplacementNamed(context, routes[index]);
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
    );
  }
}
