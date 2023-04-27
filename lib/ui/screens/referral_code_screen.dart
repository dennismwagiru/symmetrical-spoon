import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:tuntigi/app/app_routes.dart';
import 'package:tuntigi/ui/widgets/loadable_widget.dart';
import 'package:tuntigi/ui/widgets/profile/profile_widget.dart';
import 'package:tuntigi/utils/colors.dart';
import 'package:tuntigi/utils/custom_style.dart';
import 'package:tuntigi/utils/dimensions.dart';
import 'package:tuntigi/utils/strings.dart';

class ReferralCodeScreen extends StatefulWidget {
  const ReferralCodeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ReferralCodeScreenState();
}

class _ReferralCodeScreenState extends State<ReferralCodeScreen> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(
              left: 30.0,
              top: 55.0,
              right: 30.0
          ),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: ProfileWidget(),
              ),
              const Spacer(),
              Text(
                  Strings.earnOnReferrals,
                  style: CustomStyle.titleStyle
              ),
              const SizedBox(height: 16),
              Text(
                Strings.referFriends,
                style: const TextStyle(
                  color: CustomColor.subTitleGreyColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                Strings.validUntil,
                style: CustomStyle.subTitleStyle,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              GestureDetector(
                child: Container(
                  height: 54.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Color((0xFFD9D9D9 * .5).round()),
                      borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius))
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Strings.tapToCopyCode,
                        style: const TextStyle(
                          color: Color(0xFF969AA8),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        Strings.referralCode,
                        style: const TextStyle(
                          color: Color(0xFF969AA8),
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.appRouteHome);
                },
              ),
              const SizedBox(height: 28),
              GestureDetector(
                child: Container(
                  height: 54.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: CustomColor.accentColor,
                      borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius))
                  ),
                  child: Center(
                    child: Text(
                      Strings.shareCode,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: Dimensions.largeTextSize
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.appRouteHome);
                },
              ),
              const SizedBox(height: 56),
            ],
          ),
        ),
      ),
    );
  }

}