import 'package:flutter/material.dart';
import 'package:tuntigi/models/gamezone.dart';
import 'package:tuntigi/network/entities/response.dart';
import 'package:tuntigi/network/nao/user_nao.dart';
import 'package:tuntigi/ui/widgets/bottom_nav_bar.dart';
import 'package:tuntigi/ui/widgets/challenges_tab_bar.dart';
import 'package:tuntigi/ui/widgets/common/balance_widget.dart';
import 'package:tuntigi/ui/widgets/common/logo_widget.dart';
import 'package:tuntigi/ui/widgets/form/search_input_widget.dart';
import 'package:tuntigi/ui/widgets/gamezone.dart';
import 'package:tuntigi/ui/widgets/profile/profile_header_widget.dart';
import 'package:tuntigi/utils/custom_style.dart';

class ChallengesScreen extends StatefulWidget {
  const ChallengesScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChallengesScreen();
}

class _ChallengesScreen extends State<ChallengesScreen> {


  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Scaffold(
            bottomNavigationBar: const BottomNavBar(index: 2),
            backgroundColor: Colors.white,
            body: Padding(
                padding: const EdgeInsets.only(
                    left: 30.0,
                    top: 30.0,
                    right: 30.0
                ),
                  child: Column(
                    children: const <Widget>[
                      ProfileHeaderWidget(),
                      SizedBox(height: 24,),
                      ChallengesTabBar(),
                    ],
                  ),
            )
        )
    );
  }
}
