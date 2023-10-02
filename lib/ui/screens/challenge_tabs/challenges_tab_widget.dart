import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tuntigi/app/app.dart';
import 'package:tuntigi/app/app_routes.dart';
import 'package:tuntigi/databases/app_database.dart';
import 'package:tuntigi/models/challenge.dart';
import 'package:tuntigi/models/transaction.dart';
import 'package:tuntigi/models/user.dart';
import 'package:tuntigi/network/entities/response.dart';
import 'package:tuntigi/network/nao/user_nao.dart';
import 'package:tuntigi/ui/widgets/challenge_item_widget.dart';
import 'package:tuntigi/ui/widgets/common/balance_widget.dart';
import 'package:tuntigi/ui/widgets/form/search_input_widget.dart';
import 'package:tuntigi/ui/widgets/transaction_item_widget.dart';
import 'package:tuntigi/viewmodels/player_viewmodel.dart';
import 'package:tuntigi/viewmodels/user_viewmodel.dart';

class ChallengesTabWidget extends StatefulWidget {
  const ChallengesTabWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChallengesTabWidget();
}

class _ChallengesTabWidget extends State<ChallengesTabWidget> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  GlobalKey<RefreshIndicatorState>();

  late PlayerViewModel _viewModel;
  List<Challenge> _challenges = [];

  @override
  void initState() {
    _viewModel = PlayerViewModel(const App());

    _fetchChallenges();

    super.initState();


  }

  _fetchChallenges() {
    _viewModel.getChallenges()
        .then((List<Challenge> challenges) {
          print('Here');
      setState(() => _challenges = challenges);
    });
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      child: Column(
        children: [
          const BalanceWidget(),
          const SizedBox(height: 14,),
          const SearchInputWidget(label: 'Search for a game ID',),
          ..._challenges.map((Challenge challenge) =>
              ChallengeItemWidget(challenge: challenge, onReply: _fetchChallenges))
        ],
      ),
    );
  }
}
