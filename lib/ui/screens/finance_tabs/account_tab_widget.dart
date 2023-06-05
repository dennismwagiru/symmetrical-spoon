import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tuntigi/app/app.dart';
import 'package:tuntigi/app/app_routes.dart';
import 'package:tuntigi/databases/app_database.dart';
import 'package:tuntigi/models/transaction.dart';
import 'package:tuntigi/models/user.dart';
import 'package:tuntigi/network/entities/response.dart';
import 'package:tuntigi/network/nao/user_nao.dart';
import 'package:tuntigi/ui/widgets/common/balance_widget.dart';
import 'package:tuntigi/ui/widgets/form/search_input_widget.dart';
import 'package:tuntigi/ui/widgets/transaction_item_widget.dart';
import 'package:tuntigi/viewmodels/user_viewmodel.dart';

class AccountTabWidget extends StatefulWidget {
  const AccountTabWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AccountTabWidget();
}

class _AccountTabWidget extends State<AccountTabWidget> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  GlobalKey<RefreshIndicatorState>();

  late AppDatabase _appDatabase;

  List<Trans> _transactions = [];

  @override
  void initState() {
    _appDatabase = const App().getAppDatabase();

    super.initState();

    _prefetchData();

  }

  _prefetchData() async {
    User? user = await _appDatabase.getUser();
    UserNAO.transactions({'userid': user?.id ?? ''}).then((NetworkResponse response) {
      if(response.isSuccessful) {
        List<Trans> transactions = [];
        for(var item in response.data) {
          transactions.add(Trans.fromMap(item));
        }
        setState(() {
          _transactions = transactions;
        });
      } else {
        Fluttertoast.showToast(msg: "Session expired. Login and try again");
        Navigator.pushReplacementNamed(context, AppRoutes.appRouteLogin);
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

        child: Column(
          children: [
            const BalanceWidget(),
            const SizedBox(height: 14,),
            SearchInputWidget(label: 'Search for a game ID, amount',),
            SizedBox(height: 20,),
            ..._transactions.map((Trans transaction) =>
                TransactionItemWidget(
                  title: transaction.receipt ?? '-',
                  date: transaction.date,
                  amount: (transaction.type?.toLowerCase() == 'deposit' ? '+' : '-') + (transaction.amount ?? '-'),
                ),
            ),
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
