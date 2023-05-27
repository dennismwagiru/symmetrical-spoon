import 'package:flutter/material.dart';
import 'package:tuntigi/app/app.dart';
import 'package:tuntigi/app/app_routes.dart';
import 'package:tuntigi/models/profile.dart';
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
  late Profile? _profile = null;

  @override
  void initState() {
    _viewModel = UserViewModel(const App());

    _viewModel.isShowingBalance();
    _viewModel.getPlayerProfile()
        .then((Profile? profile) {
      setState(() => _profile = profile);
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
                  _profile?.balance ?? "-",
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
