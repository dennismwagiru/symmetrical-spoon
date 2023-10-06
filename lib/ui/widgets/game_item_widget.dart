import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tuntigi/app/app_routes.dart';
import 'package:tuntigi/models/challenge.dart';
import 'package:tuntigi/models/game.dart';
import 'package:tuntigi/network/entities/response.dart';
import 'package:tuntigi/network/nao/user_nao.dart';
import 'package:tuntigi/utils/colors.dart';
import 'package:tuntigi/utils/custom_style.dart';
import 'package:tuntigi/utils/dimensions.dart';

import 'loadable_widget.dart';

class GameItemWidget extends StatefulWidget {
  final Game game;
  const GameItemWidget({Key? key, required Game this.game}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GameItemWidget();
}

class _GameItemWidget extends State<GameItemWidget> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
            bottom: 8,
            top: 10
        ),
        child: Column(
          children: [
            Text(
                widget.game.date_time,
                style: CustomStyle.textStyle
            ),
            const SizedBox(height: 10,),
            Table(
              columnWidths: const {
                0: FlexColumnWidth(4),
                1: FlexColumnWidth(3),
                2: FlexColumnWidth(4),
              },
              children: [
                TableRow(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    children: [
                      Container(
                        padding: const EdgeInsets.only(right: 10, top: 10),
                        alignment: Alignment.centerRight,
                        child: Text(
                          widget.game.player_1,
                          style: CustomStyle.currencyStyle,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border(
                            top: BorderSide(color: Color(0xFFDFDFDF)),
                            left: BorderSide(color: Color(0xFFDFDFDF)),
                            right: BorderSide(color: Color(0xFFDFDFDF)),
                            bottom: BorderSide(color: Color(0xFFDFDFDF)),
                          ),
                        ),
                        child: Text(
                            '${widget.game.player_1_score.toString()} : ${widget.game.player_2_score.toString()}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: CustomColor.designationGreyColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            )
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.game.player_2,
                          style: CustomStyle.currencyStyle,
                        ),
                      ),

                    ]
                )
              ],
            ),
            SizedBox(height: 11,),
          ],
        )
    );
  }
}
