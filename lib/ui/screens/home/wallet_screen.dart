import 'package:flutter/material.dart';
import 'package:tuntigi/ui/widgets/bottom_nav_bar.dart';
import 'package:tuntigi/ui/widgets/common/balance_widget.dart';
import 'package:tuntigi/ui/widgets/finance_tab_bar.dart';
import 'package:tuntigi/ui/widgets/profile/profile_header_widget.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Scaffold(
          bottomNavigationBar: const BottomNavBar(index: 1),
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.only(
                left: 30.0,
                top: 30.0,
                right: 30.0
            ),
            // child: DashboardGridView()
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  ProfileHeaderWidget(),
                  SizedBox(height: 24,),
                  FinanceTabBar(),
                ]
            ),
          ),
        )
    );
  }
}
