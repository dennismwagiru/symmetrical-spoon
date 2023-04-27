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
                  color: const Color(0xFFA72E18),
                  icon: Icons.account_balance_wallet_outlined,
                  title: Strings.wallet,
                  subTitle: Strings.walletDesc,
                  routeName: AppRoutes.appRouteWallet
              ),
              DashboardCard(
                  color: const Color(0xFF4F7F57),
                  icon: Icons.list_alt,
                  title: Strings.statement,
                  subTitle: Strings.statementDesc,
                  routeName: AppRoutes.appRouteStatement
              ),
              DashboardCard(
                  color: const Color(0xFF3D316D),
                  icon: Icons.leaderboard,
                  title: Strings.leaderboard,
                  subTitle: Strings.leaderboardDesc,
                  routeName: AppRoutes.appRouteLeaderboard
              ),
              DashboardCard(
                  color: const Color(0xFF462878),
                  icon: Icons.wallet_giftcard,
                  title: Strings.referral,
                  subTitle: Strings.referralDesc,
                  routeName: AppRoutes.appRouteReferral
              ),
            ]
        )
    );
  }
}
