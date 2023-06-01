import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuntigi/app/app.dart';
import 'package:tuntigi/app/app_routes.dart';
import 'package:tuntigi/databases/providers/balance_provider.dart';
import 'package:tuntigi/databases/providers/profile_provider.dart';
import 'package:tuntigi/models/profile.dart';
import 'package:tuntigi/utils/custom_style.dart';
import 'package:tuntigi/utils/dimensions.dart';
import 'package:tuntigi/utils/strings.dart';
import 'package:tuntigi/viewmodels/user_viewmodel.dart';

class BalanceWidget extends StatefulWidget {
  final String? nextRoute;
  const BalanceWidget({Key? key, this.nextRoute}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>  _BalanceWidget();
}

class _BalanceWidget extends State<BalanceWidget> {

  late UserViewModel _viewModel;
  late Profile? _profile = null;

  @override
  void initState() {
    _viewModel = UserViewModel(const App());

    _viewModel.getPlayerProfile()
        .then((Profile? profile) {
      setState(() => _profile = profile);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final showBalanceProvider = Provider.of<ShowBalanceProvider>(context);
    final profileProvider = Provider.of<ProfileProvider>(context);

    return showBalanceProvider.showBalance ? GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, widget.nextRoute ?? AppRoutes.appRouteTopup);
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
                  profileProvider.profile?.balance ?? "-",
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
    ): Container();
  }
}
