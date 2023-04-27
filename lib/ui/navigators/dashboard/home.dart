import 'package:flutter/material.dart';
import 'package:tuntigi/ui/widgets/common/balance_widget.dart';
import 'package:tuntigi/ui/widgets/dashboard_grid_view.dart';
import 'package:tuntigi/ui/widgets/profile/profile_header_widget.dart';


class DashboardHome extends StatelessWidget {
  const DashboardHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
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
                SizedBox(height: 44,),
                BalanceWidget(),
                DashboardGridView(),
              ]
          ),
        )
    );
  }
}