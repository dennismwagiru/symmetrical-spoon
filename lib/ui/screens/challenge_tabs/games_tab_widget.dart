import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tuntigi/app/app.dart';
import 'package:tuntigi/app/app_routes.dart';
import 'package:tuntigi/databases/app_database.dart';
import 'package:tuntigi/models/game.dart';
import 'package:tuntigi/models/transaction.dart';
import 'package:tuntigi/models/user.dart';
import 'package:tuntigi/network/entities/response.dart';
import 'package:tuntigi/network/nao/user_nao.dart';
import 'package:tuntigi/ui/widgets/common/balance_widget.dart';
import 'package:tuntigi/ui/widgets/form/search_input_widget.dart';
import 'package:tuntigi/ui/widgets/game_item_widget.dart';
import 'package:tuntigi/ui/widgets/transaction_item_widget.dart';
import 'package:tuntigi/utils/custom_style.dart';
import 'package:tuntigi/viewmodels/user_viewmodel.dart';

class GamesTabWidget extends StatefulWidget {
  const GamesTabWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GamesTabWidget();
}

class _GamesTabWidget extends State<GamesTabWidget> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  GlobalKey<RefreshIndicatorState>();

  late AppDatabase _appDatabase;
  List<Game> _games = [];


  @override
  void initState() {
    _appDatabase = const App().getAppDatabase();

    super.initState();

    _fetchGames();
  }

  _fetchGames() {
    UserNAO.games()
        .then((NetworkResponse response) async {
      List<Game> games = [];
      if(response.isSuccessful) {

        for(var item in response.data) {
          games.add(Game.fromMap(item));
        }

      }
      setState(() => _games = games);
print(games);
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
            ..._games.map((Game game) =>
                GameItemWidget(game: game))
          ],
        ),
    );
  }
}
