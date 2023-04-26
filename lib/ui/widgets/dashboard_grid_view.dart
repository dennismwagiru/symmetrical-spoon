import 'package:flutter/material.dart';
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
            crossAxisSpacing: 15,
            children: [
              DashboardCard(
                  color: Colors.red,
                  icon: Icons.account_balance_wallet_outlined,
                  title: Strings.wallet,
                  subTitle: Strings.walletDesc
              ),
              DashboardCard(
                  color: Colors.green,
                  icon: Icons.account_balance_wallet_outlined,
                  title: Strings.statement,
                  subTitle: Strings.statementDesc
              ),
              DashboardCard(
                  color: Colors.purple,
                  icon: Icons.account_balance_wallet_outlined,
                  title: Strings.leaderboard,
                  subTitle: Strings.leaderboardDesc
              ),
              DashboardCard(
                  color: Colors.purple,
                  icon: Icons.account_balance_wallet_outlined,
                  title: Strings.referral,
                  subTitle: Strings.referralDesc
              ),
            ]
        )
    );
  }
}
