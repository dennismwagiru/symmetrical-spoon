import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:tuntigi/app/app.dart';
import 'package:tuntigi/app/app_routes.dart';
import 'package:tuntigi/utils/colors.dart';
import 'package:tuntigi/utils/custom_style.dart';
import 'package:tuntigi/utils/dimensions.dart';
import 'package:tuntigi/utils/strings.dart';
import 'package:tuntigi/viewmodels/user_viewmodel.dart';

class WalletWidget extends StatefulWidget {
  const WalletWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>  _WalletWidget();
}

class _WalletWidget extends State<WalletWidget> {

  late UserViewModel _viewModel;
  late bool _isShowingBalance = false;

  @override
  void initState() {
    _viewModel = UserViewModel(const App());
    _viewModel.isShowingBalance();

    super.initState();
    subscribeToViewModel();
  }
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
          GestureDetector(
            onTap: () {
              _viewModel.setIsShowingBalance(!_isShowingBalance);
              setState(() => _isShowingBalance = !_isShowingBalance);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: _isShowingBalance ? const Color(0xFFD9D9D9) : const Color(0xFFD9D9D9),
                  borderRadius: const BorderRadius.all(Radius.circular(5))
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 3,
                    horizontal: 9
                ),
                child: Row(
                  children: [
                    Text(
                        _isShowingBalance ? Strings.hideBalance : Strings.showBalance,
                        style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFAEAEAE)
                        )
                    ),
                    const SizedBox(width: 5),
                    Icon(
                        _isShowingBalance ? Icons.visibility_off : Icons.remove_red_eye_outlined,
                        size: 16,
                        color: const Color(0xFFAEAEAE)
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]
    );
  }

  void subscribeToViewModel() {
    _viewModel.getShowBalance()
        .listen((event) {
          setState(() => _isShowingBalance = event);
    });
  }
}
