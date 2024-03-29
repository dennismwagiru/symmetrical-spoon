import 'package:flutter/material.dart';
import 'package:tuntigi/app/app.dart';
import 'package:tuntigi/app/app_routes.dart';
import 'package:tuntigi/models/player.dart';
import 'package:tuntigi/ui/widgets/bottom_nav_bar.dart';
import 'package:tuntigi/ui/widgets/common/balance_widget.dart';
import 'package:tuntigi/ui/widgets/profile/profile_header_widget.dart';
import 'package:tuntigi/ui/widgets/profile/profile_widget.dart';
import 'package:tuntigi/ui/widgets/profile/wallet_widget.dart';
import 'package:tuntigi/utils/colors.dart';
import 'package:tuntigi/utils/custom_style.dart';
import 'package:tuntigi/utils/strings.dart';
import 'package:tuntigi/viewmodels/player_viewmodel.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LeaderboardScreen();
}

class _LeaderboardScreen extends State<LeaderboardScreen> {

  late List<Player> _players = [];
  late PlayerViewModel _viewModel;

  @override
  void initState() {
    _viewModel = PlayerViewModel(const App());

    _viewModel.getPlayers()
        .then((List<Player> players) =>
        setState(() => _players = players));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Scaffold(
          backgroundColor: Colors.white,
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
                  Row(
                    children: [
                      const ProfileWidget(),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, AppRoutes.appRouteReferralCode);
                        },
                        child: Row(
                          children: [
                            Text(
                              Strings.earn,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10
                              ),
                            ),
                            const SizedBox(
                              width: 11,
                            ),
                            Container(
                              height: 45,
                              width: 45,
                              decoration: const BoxDecoration(
                                  color: CustomColor.walletGreyColor,
                                  borderRadius: BorderRadius.all(Radius.circular(50))
                              ),
                              child: const Icon(
                                Icons.card_giftcard,
                                size: 20.0,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),

                      )
                    ],
                  ),
                  const SizedBox(height: 44,),
                  const Text(
                    'Tuntigi Gaming',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12
                    ),
                  ),
                  const SizedBox(height: 5,),
                  const Text(
                    'Leaderboard',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                      child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Table(
                      columnWidths: const {
                        0: FlexColumnWidth(4),
                        1: FlexColumnWidth(.5),
                        2: FlexColumnWidth(.5),
                        3: FlexColumnWidth(.5),
                        4: FlexColumnWidth(.5),
                        5: FlexColumnWidth(.5),
                      },
                      border: const TableBorder(
                          horizontalInside: BorderSide(
                              width: 1,
                              color: Colors.white,
                              style: BorderStyle.solid
                          )
                      ),
                      children: [
                        TableRow(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: const Color(0xFFFAFAF8)
                            ),
                            children: [
                              TableCell(
                                  child: Container(
                                    padding: const EdgeInsets.only(left:10, bottom: 7, top: 7),
                                    child: Text(
                                      "Player",
                                      style: CustomStyle.tableHeaderStyle,
                                    ),
                                  )
                              ),
                              TableCell(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 7),
                                    child: Text(
                                      "W",
                                      style: CustomStyle.tableHeaderStyle,
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                              ),
                              TableCell(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 7),
                                    child: Text(
                                        "D",
                                        style: CustomStyle.tableHeaderStyle,
                                        textAlign: TextAlign.center
                                    ),
                                  )
                              ),
                              TableCell(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 7),
                                    child: Text(
                                        "L",
                                        style: CustomStyle.tableHeaderStyle,
                                        textAlign: TextAlign.center
                                    ),
                                  )
                              ),
                              TableCell(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 7),
                                    child: Text(
                                        "GD",
                                        style: CustomStyle.tableHeaderStyle,
                                        textAlign: TextAlign.center
                                    ),
                                  )
                              ),
                              TableCell(
                                  child: Container(
                                    padding: const EdgeInsets.only(top: 7, bottom: 7, right: 4),
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFFAFAF8),
                                    ),
                                    child: Text(
                                        "PTS",
                                        style: CustomStyle.tableHeaderStyle,
                                        textAlign: TextAlign.center
                                    ),
                                  )
                              )
                            ]
                        ),
                        ..._players.map((Player player) =>
                            TableRow(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                children: [

                                  TableCell(
                                      child: Container(
                                        padding: const EdgeInsets.only(left:10, bottom: 7, top: 7),
                                        child: Text(
                                          '${player.position != null ? player.position.toString() : ''}. ${player.name.toUpperCase()}',
                                          style: CustomStyle.tableDataStyle,
                                        ),
                                      )
                                  ),
                                  TableCell(
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(vertical: 7),
                                        child: Text(
                                            player.wins.toString(),
                                            style: CustomStyle.tableDataStyle,
                                            textAlign: TextAlign.center
                                        ),
                                      )
                                  ),
                                  TableCell(
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(vertical: 7),
                                        child: Text(
                                            player.draws.toString(),
                                            style: CustomStyle.tableDataStyle,
                                            textAlign: TextAlign.center
                                        ),
                                      )
                                  ),
                                  TableCell(
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(vertical: 7),
                                        decoration: const BoxDecoration(
                                            border: Border(
                                                right: BorderSide(
                                                    color: Colors.white,
                                                    width: 2
                                                )
                                            )
                                        ),
                                        child: Text(
                                            player.loses.toString(),
                                            style: CustomStyle.tableDataStyle,
                                            textAlign: TextAlign.center
                                        ),
                                      )
                                  ),
                                  TableCell(
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(vertical: 7),
                                        decoration: const BoxDecoration(
                                            border: Border(
                                                right: BorderSide(
                                                    color: Colors.white,
                                                    width: 2
                                                )
                                            )
                                        ),
                                        child: Text(
                                            player.gd.toString(),
                                            style: CustomStyle.tableDataStyle,
                                            textAlign: TextAlign.center
                                        ),
                                      )
                                  ),
                                  TableCell(
                                      child: Container(
                                        padding: const EdgeInsets.only(top: 7, bottom: 7, right: 4),
                                        child: Text(
                                            player.score.toString(),
                                            style: CustomStyle.tableDataStyle,
                                            textAlign: TextAlign.center
                                        ),
                                      )
                                  )
                                ]
                            ),
                        ),

                        // TableRow(
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(4),
                        //     ),
                        //     children: [
                        //       TableCell(
                        //           child: Container(
                        //             padding: const EdgeInsets.only(left:10, bottom: 7, top: 7),
                        //             child: Text(
                        //               "2 John Kama".toUpperCase(),
                        //               style: CustomStyle.tableDataStyle,
                        //             ),
                        //           )
                        //       ),
                        //       TableCell(
                        //           child: Container(
                        //             padding: const EdgeInsets.symmetric(vertical: 7),
                        //             child: Text(
                        //                 "8",
                        //                 style: CustomStyle.tableDataStyle,
                        //                 textAlign: TextAlign.center
                        //             ),
                        //           )
                        //       ),
                        //       TableCell(
                        //           child: Container(
                        //             padding: const EdgeInsets.symmetric(vertical: 7),
                        //             child: Text(
                        //                 "0",
                        //                 style: CustomStyle.tableDataStyle,
                        //                 textAlign: TextAlign.center
                        //             ),
                        //           )
                        //       ),
                        //       TableCell(
                        //           child: Container(
                        //             padding: const EdgeInsets.symmetric(vertical: 7),
                        //             decoration: BoxDecoration(
                        //                 border: Border(
                        //                     right: BorderSide(
                        //                         color: Colors.white,
                        //                         width: 2
                        //                     )
                        //                 )
                        //             ),
                        //             child: Text(
                        //                 "0",
                        //                 style: CustomStyle.tableDataStyle,
                        //                 textAlign: TextAlign.center
                        //             ),
                        //           )
                        //       ),
                        //       TableCell(
                        //           child: Container(
                        //             padding: const EdgeInsets.only(top: 7, bottom: 7, right: 4),
                        //             decoration: const BoxDecoration(
                        //                 color: Color(0xFFFAFAF8),
                        //                 borderRadius: BorderRadius.only(
                        //                     topRight: Radius.circular(4),
                        //                     bottomRight: Radius.circular(4)
                        //                 )
                        //             ),
                        //             child: Text(
                        //                 "24",
                        //                 style: CustomStyle.tableDataStyle,
                        //                 textAlign: TextAlign.center
                        //             ),
                        //           )
                        //       )
                        //     ]
                        // ),
                        // TableRow(
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(4),
                        //     ),
                        //     children: [
                        //       TableCell(
                        //           child: Container(
                        //             padding: const EdgeInsets.only(left:10, bottom: 7, top: 7),
                        //             child: Text(
                        //               "3 Anne Fatuma".toUpperCase(),
                        //               style: CustomStyle.tableDataStyle,
                        //             ),
                        //           )
                        //       ),
                        //       TableCell(
                        //           child: Container(
                        //             padding: const EdgeInsets.symmetric(vertical: 7),
                        //             child: Text(
                        //                 "8",
                        //                 style: CustomStyle.tableDataStyle,
                        //                 textAlign: TextAlign.center
                        //             ),
                        //           )
                        //       ),
                        //       TableCell(
                        //           child: Container(
                        //             padding: const EdgeInsets.symmetric(vertical: 7),
                        //             child: Text(
                        //                 "0",
                        //                 style: CustomStyle.tableDataStyle,
                        //                 textAlign: TextAlign.center
                        //             ),
                        //           )
                        //       ),
                        //       TableCell(
                        //           child: Container(
                        //             padding: const EdgeInsets.symmetric(vertical: 7),
                        //             child: Text(
                        //                 "0",
                        //                 style: CustomStyle.tableDataStyle,
                        //                 textAlign: TextAlign.center
                        //             ),
                        //           )
                        //       ),
                        //       TableCell(
                        //           child: Container(
                        //             padding: const EdgeInsets.only(top: 7, bottom: 7, right: 4),
                        //             decoration: const BoxDecoration(
                        //                 color: Color(0xFFFAFAF8),
                        //                 borderRadius: BorderRadius.only(
                        //                     topRight: Radius.circular(4),
                        //                     bottomRight: Radius.circular(4)
                        //                 )
                        //             ),
                        //             child: Text(
                        //                 "24",
                        //                 style: CustomStyle.tableDataStyle,
                        //                 textAlign: TextAlign.center
                        //             ),
                        //           )
                        //       )
                        //     ]
                        // ),
                      ],
                    ),
                  )
                  )
                ]
            ),
          ),
        )
    );
  }
}
