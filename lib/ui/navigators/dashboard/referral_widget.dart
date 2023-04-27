import 'package:flutter/material.dart';
import 'package:tuntigi/ui/widgets/profile/profile_header_widget.dart';

class ReferralWidget extends StatelessWidget {
  const ReferralWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: const EdgeInsets.only(
                left: 30.0,
                top: 30.0,
                right: 30.0
            ),
            // child: DashboardGridView()
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  ProfileHeaderWidget(),
                  Text('Referral')
                ],
              ),
            )
        )
    );
  }
}