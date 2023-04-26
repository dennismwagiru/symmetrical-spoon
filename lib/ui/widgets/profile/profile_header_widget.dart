import 'package:flutter/material.dart';
import 'package:tuntigi/ui/widgets/profile/profile_widget.dart';
import 'package:tuntigi/ui/widgets/profile/wallet_widget.dart';
import 'package:tuntigi/utils/colors.dart';
import 'package:tuntigi/utils/custom_style.dart';
import 'package:tuntigi/utils/strings.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        ProfileWidget(),
        Spacer(),
        WalletWidget()
      ],
    );
  }
}
