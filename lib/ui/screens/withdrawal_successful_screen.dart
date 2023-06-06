import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuntigi/app/app.dart';
import 'package:tuntigi/app/app_routes.dart';
import 'package:tuntigi/databases/providers/profile_provider.dart';
import 'package:tuntigi/models/profile.dart';
import 'package:tuntigi/utils/colors.dart';
import 'package:tuntigi/utils/custom_style.dart';
import 'package:tuntigi/utils/dimensions.dart';
import 'package:tuntigi/utils/strings.dart';
import 'package:tuntigi/viewmodels/user_viewmodel.dart';

class WithdrawalSuccessfulScreen extends StatefulWidget {
  const WithdrawalSuccessfulScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WithdrawalSuccessfulScreen();
}

class _WithdrawalSuccessfulScreen extends State<WithdrawalSuccessfulScreen> {

  late UserViewModel _viewModel;

  @override
  void initState() {
    _viewModel = UserViewModel(const App());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.only(left: Dimensions.defaultPaddingSize, right: Dimensions.defaultPaddingSize),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: const BoxDecoration(
                          color: CustomColor.accentColor,
                          borderRadius: BorderRadius.all(Radius.circular(50))
                      ),
                      child: const Icon(
                        Icons.check,
                        size: 30.0,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 37),
                    Text(
                        Strings.withdrawalSuccessful,
                        style: CustomStyle.titleStyle
                    ),
                    const SizedBox(height: 16),
                    Text(
                        Strings.withdrawalSuccessDesc,
                        style: CustomStyle.subTitleStyle,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 217),
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
                            Strings.next,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: Dimensions.largeTextSize
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        _viewModel.getPlayerProfile(refresh: true).then((Profile? profile) {
                          profileProvider.profile = profile;
                          Navigator.pushNamedAndRemoveUntil(context, AppRoutes.appRouteDashboard,  (Route<dynamic> route) => false,);   //// this MainPage is your page to refresh

                          // Navigator.pop(context);
                        });

                      },
                    ),
                    const SizedBox(height: 56),
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}
