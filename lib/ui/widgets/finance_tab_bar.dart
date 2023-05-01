import 'package:flutter/material.dart';
import 'package:tuntigi/ui/screens/finance_tabs/account_tab_widget.dart';
import 'package:tuntigi/ui/screens/finance_tabs/deposit_tab_widget.dart';
import 'package:tuntigi/ui/screens/finance_tabs/withdrawal_tab_widget.dart';
import 'package:tuntigi/ui/widgets/common/balance_widget.dart';
import 'package:tuntigi/utils/custom_style.dart';

class FinanceTabBar extends StatelessWidget {
  const FinanceTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: Color(0xFFF4F4F4),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: TabBar(
                    dividerColor: Colors.white,
                    indicatorColor: Colors.black,
                    labelStyle: CustomStyle.tabTitleStyle,
                    unselectedLabelColor: const Color(0xFFAEAEAE),
                    tabs: const [
                      Tab(
                          child: Text('Account'),
                      ),
                      Tab(
                        child: Text('Deposit'),
                      ),
                      Tab(
                        child: Text('Withdrawal'),
                      )
                    ]
                ),
              ),
              const SizedBox(height: 14,),
              const BalanceWidget(),
              const SizedBox(height: 14,),
              const Expanded(
                  child: TabBarView(
                    children: [
                      AccountTabWidget(),
                      DepositTabWidget(),
                      WithdrawalTabWidget()
                    ],
                  )
              )
            ],
          ),
        )
    );
  }
}
