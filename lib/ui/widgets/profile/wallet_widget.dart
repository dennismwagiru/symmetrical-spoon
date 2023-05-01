import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:tuntigi/app/app_routes.dart';
import 'package:tuntigi/utils/colors.dart';
import 'package:tuntigi/utils/custom_style.dart';
import 'package:tuntigi/utils/dimensions.dart';
import 'package:tuntigi/utils/strings.dart';

class WalletWidget extends StatelessWidget {
  const WalletWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
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

          ),
          const SizedBox(height: 32),
          Container(
            decoration: const BoxDecoration(
                color: Color(0xFFD9D9D9),
                borderRadius: BorderRadius.all(Radius.circular(5))
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 3,
                  horizontal: 9
              ),
              child: Row(
                children: [
                  Text(
                      Strings.hideBalance,
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFAEAEAE)
                      )
                  ),
                  const SizedBox(width: 5),
                  const Icon(
                      Icons.remove_red_eye_outlined,
                      size: 16,
                      color: Color(0xFFAEAEAE)
                  ),
                ],
              ),
            ),
          ),
        ]
    );
  }
}
