import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:tuntigi/app/app.dart';
import 'package:tuntigi/app/app_routes.dart';
import 'package:tuntigi/databases/app_database.dart';
import 'package:tuntigi/databases/providers/profile_provider.dart';
import 'package:tuntigi/models/profile.dart';
import 'package:tuntigi/network/entities/response.dart';
import 'package:tuntigi/network/nao/user_nao.dart';
import 'package:tuntigi/ui/widgets/common/logo_widget.dart';
import 'package:tuntigi/ui/widgets/form/message_widget.dart';
import 'package:tuntigi/ui/widgets/form/password_input_widget.dart';
import 'package:tuntigi/ui/widgets/form/text_input_widget.dart';
import 'package:tuntigi/ui/widgets/loadable_widget.dart';
import 'package:tuntigi/utils/colors.dart';
import 'package:tuntigi/utils/custom_style.dart';
import 'package:tuntigi/utils/dimensions.dart';
import 'package:tuntigi/utils/strings.dart';
import 'package:tuntigi/viewmodels/user_viewmodel.dart';

class ResetPinScreen extends StatefulWidget {
  const ResetPinScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ResetPinScreen();
}

class _ResetPinScreen extends State<ResetPinScreen> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _loading = false;
  String? _message;
  late Map<String, dynamic> _errors = {};

  TextEditingController mobileController = TextEditingController();


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              loginWidget(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget loginWidget(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
            left: Dimensions.defaultPaddingSize,
            right: Dimensions.defaultPaddingSize
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const LogoWidget(),
            const SizedBox(height: 33),
            MessageWidget(message: _message),
            const SizedBox(height: 33),
            Text(
                Strings.welcomeBack,
                style: CustomStyle.titleStyle
            ),
            const SizedBox(height: 11,),
            Text(
                "Reset Your Pin Here",
                style: CustomStyle.subTitleStyle
            ),
            const SizedBox(height: 105),
            Form(
                key: formKey,
                child: Column(
                  children: [
                    TextInputWidget(
                      label: Strings.phoneNumber,
                      controller: mobileController,
                      textInputType: TextInputType.phone,
                      suffix: mobileController.value.text.isNotEmpty && !_errors.containsKey('mobileno') ? const Icon(
                        Icons.check_circle,
                        color: CustomColor.blueColor,
                        size: 34,
                      ) : null,
                      errorText: _errors.containsKey('mobileno') ? _errors['mobileno'][0] : null,

                    ),
                    const SizedBox(height: Dimensions.heightSize),
                  ],
                )
            ),
            const SizedBox(height: 39),
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
                        "Reset Pin",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: Dimensions.largeTextSize
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() => {
                      _loading = true,
                      _message = null
                    });
                    UserNAO.resetPin(mobileno: mobileController.value.text)
                        .then((NetworkResponse response) async {
                      if(response.isSuccessful) {
                        Fluttertoast.showToast(msg: "Reset Pin Successful");
                        Navigator.popAndPushNamed(context, AppRoutes.appRouteLogin);
                      } else {
                        setState(() => {
                          _loading = false,
                          _message = null
                        });
                        const JsonDecoder decoder = JsonDecoder();
                        try {
                          final Map<String, dynamic> res = decoder.convert(
                              response.error ?? '');
                          if(res.containsKey('error')) {
                            setState(() {
                              _errors = {
                                'mobileno': [res['error']],
                                'pin': [res['error']]
                              };
                            });
                          } else {
                            setState(() => _errors = res);
                          }
                        } on Exception catch (e) {
                          setState(() => _message = response.error);
                        }
                      }
                    });
                    // Navigator.pushReplacementNamed(context, AppRoutes.appRouteDashboard);
                  },
                )
            ),
            const SizedBox(height: 41),
          ],
        )
    );
  }


}