import 'package:flutter/material.dart';
import 'package:tuntigi/app/app_routes.dart';

final routes = [
  AppRoutes.appRouteDashboard,
  AppRoutes.appRouteWallet,
  AppRoutes.appRouteChallenges,
  AppRoutes.appRouteGamezones
];

class BottomNavBar extends StatelessWidget {
  final int index;
  const BottomNavBar({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/home-idle.png',
              height: 21.69,
              width: 21.69,
            ),
            activeIcon: Image.asset(
              'assets/images/home-selected.png',
              height: 21.69,
              width: 21.69,
            ),
            // icon: Icon(
            //   Icons.home,
            //   color: index == 0 ? Colors.blue : Colors.grey,
            //   size: 26,
            // ),

            label: "Dashboard"
        ),
        BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/news-idle.png',
              height: 21.69,
              width: 21.69,
            ),
            activeIcon: Image.asset(
              'assets/images/news-selected.png',
              height: 21.69,
              width: 21.69,
            ),
            // icon: Icon(
            //   Icons.auto_graph,
            //   color: index == 1 ? Colors.blue : Colors.grey,
            //   size: 26,
            // ),
            label: "Wallet"
        ),
        BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/challenge-idle.png',
              height: 21.69,
              width: 21.69,
            ),
            activeIcon: Image.asset(
              'assets/images/challenge-selected.png',
              height: 21.69,
              width: 21.69,
            ),
            // icon: Icon(
            //   Icons.rule_folder_outlined,
            //   color: index == 2 ? Colors.blue : Colors.grey,
            //   size: 26,
            // ),
            label: "Challenges"
        ),
        BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/profile-idle.png',
              height: 21.69,
              width: 21.69,
            ),
            activeIcon: Image.asset(
              'assets/images/profile-selected.png',
              height: 21.69,
              width: 21.69,
            ),
            // icon: Icon(
            //   Icons.settings_sharp,
            //   color: index == 3 ? Colors.blue : Colors.grey,
            //   size: 35,
            // ),
            label: "Game Zones"
        ),
      ],
      currentIndex: index,
      // fixedColor: Colors.red,

      onTap: (index) {
        Navigator.pushReplacementNamed(context, routes[index]);
      },
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: const Color(0xFF156CF7),
      unselectedItemColor: const Color(0xFFAEAEAE),
      selectedIconTheme: const IconThemeData(
          color: Color(0xFF156CF7)
      ),
      selectedLabelStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
      unselectedLabelStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
      // selectedIconTheme:
      // const IconThemeData(color: Colors.blue, opacity: 1.0, size: 30.0),
      // unselectedItemColor: Colors.grey,
      // unselectedLabelStyle: TextStyle(color: Colors.red, fontSize: 20),
    );
  }
}
