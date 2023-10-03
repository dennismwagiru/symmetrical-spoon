import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tuntigi/app/app_routes.dart';
import 'package:tuntigi/models/challenge.dart';
import 'package:tuntigi/network/entities/response.dart';
import 'package:tuntigi/network/nao/user_nao.dart';
import 'package:tuntigi/utils/colors.dart';
import 'package:tuntigi/utils/custom_style.dart';
import 'package:tuntigi/utils/dimensions.dart';

import 'loadable_widget.dart';

class ChallengeItemWidget extends StatefulWidget {
  final Challenge challenge;
  final Function onReply;
  const ChallengeItemWidget({Key? key, required Challenge this.challenge, required this.onReply}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChallengeItemWidget();
}

class _ChallengeItemWidget extends State<ChallengeItemWidget> {
  // final Challenge challenge;
  // const ChallengeItemWidget({Key? key, required Challenge this.challenge,}) : super(key: key);
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
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.challenge.vs,
                      style: CustomStyle.titleStyle,
                    ),
                    const SizedBox(height: 2,),
                    Text(
                        widget.challenge.gamezone,
                        style: CustomStyle.textStyle
                    ),
                    const SizedBox(height: 2,),
                    Text(
                        "Games: ${widget.challenge.games}",
                        style: CustomStyle.textStyle
                    ),
                    const SizedBox(height: 2,),
                    Text(
                        widget.challenge.date_time,
                        style: CustomStyle.textStyle
                    ),
                  ],
                ),
                const Spacer(),

              ],
            ),
            SizedBox(height: 11,),
            LoadableWidget(
                loading: _loading,
                widget: Row(
                  children: [
                    Expanded(
                      child:GestureDetector(
                        child: Container(
                          height: 40.0,
                          decoration: const BoxDecoration(
                              color: CustomColor.greenColor,
                              borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius))
                          ),
                          child: Center(
                            child: Text(
                              "Accept",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Dimensions.largeTextSize
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          replyToChallenge(1);
                          // Navigator.pushReplacementNamed(context, AppRoutes.appRouteDashboard);
                        },
                      ),
                    ),
                    SizedBox(width: 18,),
                    Expanded(
                      child:GestureDetector(
                        child: Container(
                          height: 40.0,
                          decoration: const BoxDecoration(
                              color: CustomColor.redColor,
                              borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius))
                          ),
                          child: Center(
                            child: Text(
                              "Reject",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Dimensions.largeTextSize
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          replyToChallenge(2);
                        },
                      ),
                    )
                  ],
                )
            ),
            SizedBox(height: 8,),
            Divider(),
          ],
        )
    );
  }

  void replyToChallenge(int response) {
    setState(() => _loading = true);
    final payload = new Map<String,dynamic>();
    payload['challengeid'] = widget.challenge.challenge_id;
    payload['reply'] = response;
    UserNAO.replyToChallenge(payload)
        .then((NetworkResponse response) async {
      if(response.isSuccessful) {
        Fluttertoast.showToast(msg: response.data);
        setState(() => _loading = false);
      }
      widget.onReply();
    });
  }
}
