import 'package:flutter/material.dart';
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
          Row(
            children: [
              Text(
                Strings.earn,
              ),
              const Padding(
                padding: EdgeInsets.only(
                    right: Dimensions.marginSize / 2
                ),
              ),
              GestureDetector(
                child: const Icon(
                  Icons.card_giftcard,
                  size: 20.0,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},

            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(Colors.grey),
            ),
            child: Row(
              children: [
                Text(Strings.hideBalance, style: const TextStyle(
                    fontSize: 12
                )),
                const SizedBox(width: 5),
                const Icon(Icons.remove_red_eye_outlined, size: 16,),
              ],
            ),
          ),
        ]
    );
  }
}
