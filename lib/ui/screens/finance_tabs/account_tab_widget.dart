import 'package:flutter/material.dart';
import 'package:tuntigi/ui/widgets/common/balance_widget.dart';
import 'package:tuntigi/ui/widgets/form/search_input_widget.dart';
import 'package:tuntigi/ui/widgets/transaction_item_widget.dart';

class AccountTabWidget extends StatelessWidget {
  const AccountTabWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          const BalanceWidget(),
          const SizedBox(height: 14,),
          SearchInputWidget(label: 'Search for a game ID, amount',),
          SizedBox(height: 20,),
          // TransactionItemWidget(title: 'Game ID: 15202', date: 'April 20, 4:34 PM', amount: '+75',),
          // TransactionItemWidget(title: 'Game ID: 14213', date: 'April 20, 4:34 PM', amount: '-50',),
          // TransactionItemWidget(title: 'Game ID: 1422', date: 'April 20, 4:34 PM', amount: '+43',),
          // TransactionItemWidget(title: 'Game ID: 11072', date: 'April 20, 4:34 PM', amount: '+64',),
          // TransactionItemWidget(title: 'Game ID: 10758', date: 'April 20, 4:34 PM', amount: '-126',),
          // TransactionItemWidget(title: 'Game ID: 10928', date: 'April 20, 4:34 PM', amount: '+49',),
        ],
      ),
    );
  }
}
