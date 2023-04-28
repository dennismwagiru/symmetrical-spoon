import 'package:flutter/material.dart';
import 'package:tuntigi/utils/custom_style.dart';

class TransactionItemWidget extends StatelessWidget {
  final String title;
  final String date;
  final String amount;
  const TransactionItemWidget({Key? key, required this.title, required this.date, required this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          bottom: 8,
          top: 8
        ),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: CustomStyle.transactionTitleStyle,
                ),
                const SizedBox(height: 2,),
                Text(
                    date,
                    style: CustomStyle.transactionDateStyle
                ),
              ],
            ),
            const Spacer(),
            Text(
              amount,
              style: CustomStyle.subHeadersStyle,
            )
          ],
        )
    );
  }
}
