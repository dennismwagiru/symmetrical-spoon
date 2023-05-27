import 'package:flutter/material.dart';
import 'package:tuntigi/app/app.dart';
import 'package:tuntigi/models/profile.dart';
import 'package:tuntigi/ui/widgets/profile/profile_widget.dart';
import 'package:tuntigi/ui/widgets/profile/wallet_widget.dart';
import 'package:tuntigi/utils/colors.dart';
import 'package:tuntigi/utils/custom_style.dart';
import 'package:tuntigi/utils/strings.dart';
import 'package:tuntigi/viewmodels/user_viewmodel.dart';

class ProfileHeaderWidget extends StatefulWidget {
  const ProfileHeaderWidget({super.key});

  @override
  State<StatefulWidget> createState() => _ProfileHeaderWidget();

}

class _ProfileHeaderWidget extends State<ProfileHeaderWidget> {



  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileWidget(),
        Spacer(),
        WalletWidget()
      ],
    );
  }
}
