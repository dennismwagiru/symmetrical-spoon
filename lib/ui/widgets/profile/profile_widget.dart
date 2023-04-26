import 'package:flutter/material.dart';
import 'package:tuntigi/utils/colors.dart';
import 'package:tuntigi/utils/custom_style.dart';
import 'package:tuntigi/utils/strings.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          child: const Icon(
            Icons.account_circle,
            color: CustomColor.primaryColor,
            size: 40.0,
          ),
        ),
        Text(
          Strings.greeting,
          style: CustomStyle.titleStyle,
        ),
        Text(
          Strings.designation,
          style: CustomStyle.subTitleStyle,
        ),
      ],
    );
  }
}
