import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuntigi/app/app.dart';
import 'package:tuntigi/databases/providers/profile_provider.dart';
import 'package:tuntigi/models/profile.dart';
import 'package:tuntigi/utils/colors.dart';
import 'package:tuntigi/utils/custom_style.dart';
import 'package:tuntigi/utils/strings.dart';
import 'package:tuntigi/viewmodels/user_viewmodel.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<StatefulWidget> createState() => _ProfileWidget();

}

class _ProfileWidget extends State<ProfileWidget> {

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 45,
          width: 45,
          decoration: const BoxDecoration(
              color: CustomColor.accentColor,
              borderRadius: BorderRadius.all(Radius.circular(50))
          ),
        ),
        // GestureDetector(
        //   child: const Icon(
        //     Icons.account_circle,
        //     color: CustomColor.primaryColor,
        //     size: 40.0,
        //   ),
        // ),
        const SizedBox(height: 23),
        Text(
          '${Strings.greeting} ${profileProvider.profile?.name ?? '-'}',
          style: CustomStyle.greetingStyle,
        ),
        const SizedBox(height: 5),
        Text(
          profileProvider.profile?.rank ?? '-',
          style: CustomStyle.designationStyle,
        ),
      ],
    );
  }
}
