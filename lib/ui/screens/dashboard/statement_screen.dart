import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tuntigi/app/app.dart';
import 'package:tuntigi/app/app_routes.dart';
import 'package:tuntigi/databases/app_database.dart';
import 'package:tuntigi/models/transaction.dart';
import 'package:tuntigi/models/user.dart';
import 'package:tuntigi/network/entities/response.dart';
import 'package:tuntigi/network/nao/user_nao.dart';
import 'package:tuntigi/ui/widgets/bottom_nav_bar.dart';
import 'package:tuntigi/ui/widgets/common/balance_widget.dart';
import 'package:tuntigi/ui/widgets/form/search_input_widget.dart';
import 'package:tuntigi/ui/widgets/profile/profile_header_widget.dart';
import 'package:tuntigi/ui/widgets/transaction_item_widget.dart';

class StatementScreen extends StatefulWidget {
  const StatementScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StatementScreen();
}

class _StatementScreen extends State<StatementScreen> {
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
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Scaffold(
          bottomNavigationBar: const BottomNavBar(index: 0),
          body: Padding(
            padding: const EdgeInsets.only(
                left: 30.0,
                top: 30.0,
                right: 30.0
            ),
            // child: DashboardGridView()
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProfileHeaderWidget(),

                  Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 44,),
                            const BalanceWidget(),
                            const SizedBox(height: 14,),
                            const SearchInputWidget(label: 'Search for a game ID, amount',),
                            const SizedBox(height: 20,),
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
                      ))
                ]
            ),
          ),
        )
    );
  }
}
