import 'package:flutter/material.dart';
import 'package:tuntigi/app/app.dart';
import 'package:tuntigi/app/app_routes.dart';
import 'package:tuntigi/utils/custom_style.dart';
import 'package:tuntigi/utils/dimensions.dart';
import 'package:tuntigi/utils/strings.dart';
import 'package:tuntigi/viewmodels/user_viewmodel.dart';

class BalanceWidget extends StatefulWidget {
  const BalanceWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>  _BalanceWidget();
}

class _BalanceWidget extends State<BalanceWidget> {

  late UserViewModel _viewModel;
  late bool _isShowingBalance = false;

  @override
  void initState() {
    _viewModel = UserViewModel(const App());

    Future.delayed(const Duration(milliseconds: 1000), () async {
      _viewModel.isShowingBalance();
    });

    super.initState();
    subscribeToViewModel();
  }

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

  void subscribeToViewModel() {

      _viewModel.getShowBalance()
          .listen((event) {
        print({'show Balance: ', event});
        setState(() => _isShowingBalance = event);
      });
  }
}
