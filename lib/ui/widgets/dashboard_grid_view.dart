import 'package:flutter/material.dart';
import 'package:tuntigi/app/app_routes.dart';
import 'package:tuntigi/ui/widgets/dashboard_card.dart';
import 'package:tuntigi/utils/colors.dart';
import 'package:tuntigi/utils/strings.dart';

class DashboardGridView extends StatelessWidget {
  const DashboardGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            children: [
              DashboardCard(
                  color: const Color(0xFFFFE9E5),
                  txtColor: const Color(0xFFA72E18),
                  icon: 'assets/images/wallet.png',
                  title: Strings.wallet,
                  subTitle: Strings.walletDesc,
                  routeName: AppRoutes.appRouteWallet
              ),
              DashboardCard(
                  color: const Color(0xFFEBEBEB),
                  txtColor: const Color(0xFF4F7F57),
                  icon: 'assets/images/statement.png',
                  title: Strings.statement,
                  subTitle: Strings.statementDesc,
                  routeName: AppRoutes.appRouteStatement
              ),
              DashboardCard(
                  color: const Color(0xFFEDE9FF),
                  txtColor: const Color(0xFF3D316D),
                  icon: 'assets/images/leaderboard.png',
                  title: Strings.leaderboard,
                  subTitle: Strings.leaderboardDesc,
                  routeName: AppRoutes.appRouteLeaderboard
              ),
              DashboardCard(
                  color: const Color(0xFFF2EAFF),
                  txtColor: const Color(0xFF462878),
                  icon: 'assets/images/referral.png',
                  title: Strings.referral,
                  subTitle: Strings.referralDesc,
                  routeName: AppRoutes.appRouteReferral
              ),
            ]
        )
    );
  }
}
