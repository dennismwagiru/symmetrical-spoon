import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuntigi/app/app.dart';
import 'package:tuntigi/app/app_routes.dart';
import 'package:tuntigi/databases/app_database.dart';
import 'package:tuntigi/databases/app_preferences.dart';
import 'package:tuntigi/databases/providers/profile_provider.dart';
import 'package:tuntigi/models/profile.dart';
import 'package:tuntigi/utils/colors.dart';
import 'package:tuntigi/utils/custom_style.dart';
import 'package:tuntigi/utils/strings.dart';
import 'package:tuntigi/viewmodels/user_viewmodel.dart';

class MenuItem {
  final String text;
  final IconData icon;

  const MenuItem({
    required this.text,
    required this.icon,
  });
}

class MenuItems {
  static const List<MenuItem> firstItems = [share, logout];

  static const share = MenuItem(text: 'Share', icon: Icons.share);
  static const logout = MenuItem(text: 'Logout', icon: Icons.outbond_outlined);

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(
          item.icon,
          color: CustomColor.primaryColor,
          size: 22,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          item.text,
          style: const TextStyle(
            color: CustomColor.primaryColor,
          ),
        ),
      ],
    );
  }
}

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<StatefulWidget> createState() => _ProfileWidget();

}

class _ProfileWidget extends State<ProfileWidget> {

  late AppPreferences _appPreferences;
  late AppDatabase _appDatabase;

  @override
  void initState() {
    _appPreferences = const App().getAppPreferences();
    _appDatabase = const App().getAppDatabase();
    super.initState();
  }

  void logout(context) async {
    _appDatabase.clearUser();
    await _appPreferences.isPreferenceReady;
    _appPreferences.setLoggedIn(isLoggedIn: false);
    _appPreferences.setAccessToken(
        accessToken: ''
    );

    Navigator.popAndPushNamed(context, AppRoutes.appRouteLogin);
  }

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonHideUnderline(
            child: DropdownButton2(
              customButton: const CircleAvatar(
                backgroundColor: CustomColor.primaryColor,
                child: CircleAvatar(
                  backgroundColor: CustomColor.primaryColor,
                  radius: 30,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              items: [
                // DropdownMenuItem<MenuItem>(
                //   value: MenuItems.share,
                //   child: MenuItems.buildItem(MenuItems.share),
                // ),
                DropdownMenuItem<MenuItem>(
                  value: MenuItems.logout,
                  child: MenuItems.buildItem(MenuItems.logout),
                ),

              ],
              onChanged: (value) {
                switch (value) {
                  case MenuItems.share:
                  //Do something
                    break;
                  case MenuItems.logout:
                    logout(context);
                    break;
                }
              },
              dropdownStyleData: DropdownStyleData(
                width: 160,
                padding: const EdgeInsets.symmetric(vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                elevation: 8,
                offset: const Offset(40, -4),
              ),
            )
        ),
        // Container(
        //   height: 45,
        //   width: 45,
        //   decoration: const BoxDecoration(
        //       color: CustomColor.accentColor,
        //       borderRadius: BorderRadius.all(Radius.circular(50))
        //   ),
        // ),
        // GestureDetector(
        //   child: const Icon(
        //     Icons.account_circle,
        //     color: CustomColor.primaryColor,
        //     size: 40.0,
        //   ),
        // ),
        const SizedBox(height: 13),
        Text(
          '${Strings.greeting} ${profileProvider.profile?.name ?? '-'}',
          style: CustomStyle.greetingStyle,
        ),
        const SizedBox(height: 5),
        Text(
          '${profileProvider.profile?.rank ?? '-'}, ${profileProvider.profile?.position ?? '_'}',
          style: CustomStyle.designationStyle,
        ),
      ],
    );
  }
}
