import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuntigi/app/app.dart';
import 'package:tuntigi/app/app_routes.dart';
import 'package:tuntigi/databases/app_database.dart';
import 'package:tuntigi/databases/providers/balance_provider.dart';
import 'package:tuntigi/databases/providers/profile_provider.dart';
import 'package:tuntigi/models/profile.dart';
import 'package:tuntigi/models/transaction.dart';
import 'package:tuntigi/models/user.dart';
import 'package:tuntigi/network/entities/response.dart';
import 'package:tuntigi/network/nao/user_nao.dart';
import 'package:tuntigi/utils/custom_style.dart';
import 'package:tuntigi/utils/dimensions.dart';
import 'package:tuntigi/utils/strings.dart';
import 'package:tuntigi/viewmodels/user_viewmodel.dart';

class BalanceWidget extends StatefulWidget {
  final String? nextRoute;
  final bool showTag;
  const BalanceWidget({Key? key, this.nextRoute, this.showTag = false}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>  _BalanceWidget();
}

class _BalanceWidget extends State<BalanceWidget> {

  late AppDatabase _appDatabase;

  @override
  void initState() {
    _appDatabase = const App().getAppDatabase();

    super.initState();

    _prefetchData();
  }

  void _prefetchData() async {
    User? user = await _appDatabase.getUser();
    UserNAO.transactions({'userid': user?.id ?? ''})
        .then((NetworkResponse response) async {
          if(response.isSuccessful) {
            List<Trans> transactions = [];
            return transactions;
          } else {

          }

    });
  }

  @override
  Widget build(BuildContext context) {
    final showBalanceProvider = Provider.of<ShowBalanceProvider>(context);
    final profileProvider = Provider.of<ProfileProvider>(context);

    return showBalanceProvider.showBalance ? GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, widget.nextRoute ?? AppRoutes.appRouteTopup);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget.showTag ?const Align(
            alignment: Alignment.centerLeft,
            child: Text('My Balance'),
          ) : Container(),
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: widget.showTag ? MainAxisAlignment.start : MainAxisAlignment.center,
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
          widget.showTag ? Container() : Text(
            Strings.accountBalance,
            style: CustomStyle.walletAccountBalanceStyle,
          )
        ],
      ),
    ): Container();
  }
}
