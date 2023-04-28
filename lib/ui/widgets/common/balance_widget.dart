import 'package:flutter/material.dart';
import 'package:tuntigi/app/app_routes.dart';
import 'package:tuntigi/utils/custom_style.dart';
import 'package:tuntigi/utils/dimensions.dart';
import 'package:tuntigi/utils/strings.dart';

class BalanceWidget extends StatelessWidget {
  const BalanceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.appRouteTopup);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                      Strings.currency,
                      style: CustomStyle.currencyStyle
                  ),
                ),
                Text(
                  Strings.balanceAmount,
                  style: CustomStyle.balanceAmountStyle,
                )
              ]
          ),
          Text(
            Strings.accountBalance,
            style: CustomStyle.walletAccountBalanceStyle,
          )
        ],
      ),
    );
  }
}
