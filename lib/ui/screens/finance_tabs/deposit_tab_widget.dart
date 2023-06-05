import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tuntigi/app/app.dart';
import 'package:tuntigi/app/app_routes.dart';
import 'package:tuntigi/models/profile.dart';
import 'package:tuntigi/network/entities/response.dart';
import 'package:tuntigi/network/nao/user_nao.dart';
import 'package:tuntigi/ui/widgets/common/balance_widget.dart';
import 'package:tuntigi/ui/widgets/form/message_widget.dart';
import 'package:tuntigi/ui/widgets/form/search_input_widget.dart';
import 'package:tuntigi/ui/widgets/form/text_input_widget.dart';
import 'package:tuntigi/ui/widgets/loadable_widget.dart';
import 'package:tuntigi/ui/widgets/transaction_item_widget.dart';
import 'package:tuntigi/utils/colors.dart';
import 'package:tuntigi/utils/custom_style.dart';
import 'package:tuntigi/utils/dimensions.dart';
import 'package:tuntigi/utils/strings.dart';
import 'package:tuntigi/viewmodels/user_viewmodel.dart';

class DepositTabWidget extends StatefulWidget {
  const DepositTabWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DepositTabWidget();
}

class _DepositTabWidget extends State<DepositTabWidget> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController topUpController = TextEditingController();

  bool _loading = false;
  String? _message;
  late Map<String, dynamic> _errors = {};

  late UserViewModel _viewModel;
  late Profile? _profile = null;

  @override
  void initState() {
    _viewModel = UserViewModel(const App());
    _viewModel.getPlayerProfile()
        .then((Profile? profile) {
      setState(() => _profile = profile);
      phoneController.text = profile?.mobile ?? '';
    });


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(
                    top: 54,
                    left: Dimensions.defaultPaddingSize, right: Dimensions.defaultPaddingSize),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const BalanceWidget(showTag: true,),
                    const SizedBox(height: 16),
                    MessageWidget(message: _message),
                    const SizedBox(height: 16),
                    TextInputWidget(
                      label: Strings.phoneNumber,
                      isEnabled: false,
                      controller: phoneController,
                      textInputType: TextInputType.number,
                      prefix: const Padding(
                          padding: EdgeInsets.only(
                              left: 21,
                              top: 16,
                              bottom: 14,
                              right: 11
                          ),
                          child: Text(
                            "+254",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Colors.black
                            ),
                          )
                      ),
                      errorText: _errors.containsKey('phone') ? _errors['phone'][0] : null,

                      // prefixText: 'KES.',
                      // prefixStyle: TextStyle(
                      //   fontWeight: FontWeight.w600,
                      //   fontSize: 20,
                      //   color: Colors.black
                      // ),
                      suffix: null,
                    ),
                    const SizedBox(height: 16),
                    TextInputWidget(
                      label: Strings.topupAmount,
                      controller: topUpController,
                      textInputType: TextInputType.number,
                      prefix: Padding(
                          padding: const EdgeInsets.only(
                              left: 21,
                              top: 16,
                              bottom: 14,
                              right: 11
                          ),
                          child: Text(
                            Strings.currency.toUpperCase(),
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Colors.black
                            ),
                          )
                      ),
                      errorText: _errors.containsKey('amount') ? _errors['amount'][0] : null,
                      // prefixText: 'KES.',
                      // prefixStyle: TextStyle(
                      //   fontWeight: FontWeight.w600,
                      //   fontSize: 20,
                      //   color: Colors.black
                      // ),
                      suffix: null,
                    ),
                    const SizedBox(height: 16),
                    Text(
                        Strings.minimumDeposit,
                        style: CustomStyle.subTitleStyle
                    ),
                    const SizedBox(height: 50),
                    LoadableWidget(
                      loading: _loading,
                      widget: GestureDetector(
                        child: Container(
                          height: 54.0,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                              color: CustomColor.accentColor,
                              borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius))
                          ),
                          child: Center(
                            child: Text(
                              Strings.confirm,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Dimensions.largeTextSize
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          _topup();
                        },
                      ),
                    ),
                  ],
                )
            )
          ],
        ),
      ),
    );
  }

  void _topup() {
    setState(() => {
      _loading = true,
      _errors = {},
      _message = null
    });

    Map<String, dynamic> payload = {
      "phone": phoneController.text,
      "amount": topUpController.text,
      "alias": _profile?.alias
    };
    UserNAO.deposit(payload)
        .then((NetworkResponse response) {
      setState(() {
        _loading = false;
      });
      if(response.isSuccessful) {
        Fluttertoast.showToast(msg: "Top up Successful");
        Navigator.pushReplacementNamed(context, AppRoutes.appRouteTopupSuccessful);
      } else {
        const JsonDecoder decoder = JsonDecoder();
        try {
          final Map<String, dynamic> res = decoder.convert(
              response.error ?? '');
          if(res.containsKey('message') && res['message'] == 'Unauthenticated.'){
            Fluttertoast.showToast(msg: "Session expired, Please login again to continue.");
            Navigator.pushReplacementNamed(context, AppRoutes.appRouteLogin);
          }
          if(res.containsKey('error')) {
            setState(() => _message = res['error']);
          } else {
            setState(() => _errors = res);
          }
        } on Exception catch (e) {
          setState(() => _message = response.error);
        }
      }
    })
        .onError((error, stackTrace){
      setState(() => _message = "An error occurred. Please try again later");
    });
  }
}
