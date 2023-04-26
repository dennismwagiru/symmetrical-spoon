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
          Strings.greeting,
          style: CustomStyle.greetingStyle,
        ),
        const SizedBox(height: 5),
        Text(
          Strings.designation,
          style: CustomStyle.designationStyle,
        ),
      ],
    );
  }
}
