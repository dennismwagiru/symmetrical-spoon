import 'package:flutter/material.dart';
import 'package:tuntigi/ui/widgets/form/search_input_widget.dart';
import 'package:tuntigi/ui/widgets/transaction_item_widget.dart';

class DepositTabWidget extends StatelessWidget {
  const DepositTabWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          SearchInputWidget(label: 'Search for a Reference ID, amount',),
          SizedBox(height: 20,),
          // TransactionItemWidget(title: 'M-PESA: RD1223SD4', date: 'April 20, 4:34 PM', amount: '+1,500',),
          // TransactionItemWidget(title: 'M-PESA: RD7283239', date: 'April 16, 3.03 PM', amount: '+400',),
          // TransactionItemWidget(title: 'M-PESA: TD2385222', date: 'April 10, 8.34 AM', amount: '+400',),
        ],
      ),
    );
  }
}
