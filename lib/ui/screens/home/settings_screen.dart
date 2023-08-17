import 'package:flutter/material.dart';
import 'package:tuntigi/ui/widgets/bottom_nav_bar.dart';
import 'package:tuntigi/ui/widgets/common/balance_widget.dart';
import 'package:tuntigi/ui/widgets/common/logo_widget.dart';
import 'package:tuntigi/ui/widgets/profile/profile_header_widget.dart';
import 'package:tuntigi/utils/custom_style.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Scaffold(
          bottomNavigationBar: const BottomNavBar(index: 3),
          body: Padding(
              padding: const EdgeInsets.only(
                  left: 30.0,
                  top: 30.0,
                  right: 30.0
              ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const ProfileHeaderWidget(),
                  const SizedBox(height: 20,),
                  const BalanceWidget(),
                ],
              ),
            ),
          ),
        )
    );
  }
}
