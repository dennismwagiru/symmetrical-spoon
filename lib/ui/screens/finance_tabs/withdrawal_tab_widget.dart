import 'package:flutter/material.dart';
import 'package:tuntigi/app/app_routes.dart';
import 'package:tuntigi/ui/widgets/common/balance_widget.dart';
import 'package:tuntigi/ui/widgets/form/search_input_widget.dart';
import 'package:tuntigi/ui/widgets/transaction_item_widget.dart';

class WithdrawalTabWidget extends StatelessWidget {
  const WithdrawalTabWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          BalanceWidget(nextRoute: AppRoutes.appRouteWithdraw,),
          SizedBox(height: 14,),
          SearchInputWidget(label: 'Search for a Reference ID, amount',),
          SizedBox(height: 20,),
          // TransactionItemWidget(title: 'M-PESA: RD1223SD4', date: 'April 20, 3:34 PM', amount: '-1,500',),
          // TransactionItemWidget(title: 'M-PESA: RD7283239', date: 'April 13, 4:45 PM', amount: '-900',),
          // TransactionItemWidget(title: 'M-PESA: TD2385222', date: 'April 09, 7:20 AM', amount: '-900',),
        ],
      ),
    );
  }
}
