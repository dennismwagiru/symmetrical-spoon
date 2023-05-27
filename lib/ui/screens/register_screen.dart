import 'dart:convert';

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tuntigi/app/app.dart';
import 'package:tuntigi/app/app_routes.dart';
import 'package:tuntigi/network/entities/response.dart';
import 'package:tuntigi/ui/widgets/form/message_widget.dart';
import 'package:tuntigi/ui/widgets/form/password_input_widget.dart';
import 'package:tuntigi/ui/widgets/form/text_input_widget.dart';
import 'package:tuntigi/ui/widgets/loadable_widget.dart';
import 'package:tuntigi/utils/colors.dart';
import 'package:tuntigi/utils/custom_style.dart';
import 'package:tuntigi/utils/dimensions.dart';
import 'package:tuntigi/utils/strings.dart';
import 'package:tuntigi/viewmodels/user_viewmodel.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final JsonDecoder _decoder = const JsonDecoder();

  bool _loading = false;
  String? _message;

  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();
  TextEditingController pinController = TextEditingController();

  late UserViewModel _viewModel;
  late Map<String, dynamic> _errors = {};

  @override
  void initState() {
    _viewModel = UserViewModel(const App());

    super.initState();

    subscribeToViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.only(
                      top: 54,
                      left: Dimensions.defaultPaddingSize, right: Dimensions.defaultPaddingSize),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          Strings.signUp,
                          style: CustomStyle.titleStyle
                      ),
                      const SizedBox(height: 16),
                      Text(
                          Strings.policyAgreement,
                          style: CustomStyle.subTitleStyle
                      ),
                      const SizedBox(height: 34),
                      MessageWidget(message: _message),
                      const SizedBox(height: 34),
                      Form(
                          key: formKey,
                          child: Column(
                            children: [
                              TextInputWidget(
                                label: Strings.username,
                                suffix: null,
                                controller: usernameController,
                                errorText: _errors.containsKey('alias') ? _errors['alias'][0] : null,
                              ),
                              const SizedBox(height: 26),
                              TextInputWidget(
                                label: Strings.firstName,
                                suffix: null,
                                controller: firstNameController,
                                errorText: _errors.containsKey('first_name') ? _errors['first_name'][0] : null,
                              ),
                              const SizedBox(height: 26),
                              TextInputWidget(
                                label: Strings.lastName,
                                suffix: null,
                                controller: lastNameController,
                                errorText: _errors.containsKey('last_name') ? _errors['last_name'][0] : null,
                              ),
                              const SizedBox(height: 26),
                              TextInputWidget(
                                label: Strings.email,
                                errorText: _errors.containsKey('email') ? _errors['email'][0] : null,
                                controller: emailController,
                                textInputType: TextInputType.emailAddress,
                                suffix: emailController.value.text.isNotEmpty && !_errors.containsKey('email')  ? const Icon(
                                  Icons.check_circle,
                                  color: CustomColor.blueColor,
                                  size: 34,
                                ) : null,
                              ),
                              const SizedBox(height: 26),
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
                              const SizedBox(height: 26),
                              PasswordInputWidget(
                                label: Strings.pin,
                                controller: pinController,
                                errorText: _errors.containsKey('pin') ? _errors['pin'][0] : null,
                              ),
                              const SizedBox(height: 26),
                              PasswordInputWidget(
                                label: Strings.confirmPin,
                                controller: passwordConfirmationController,
                                errorText: _errors.containsKey('confirmPin') ? _errors['confirmPin'][0] : null,
                              ),
                              const SizedBox(height: 45),

                            ],
                          )
                      ),

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
                                  Strings.signUp,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Dimensions.largeTextSize
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              _registerUser();
                            },
                          )
                      ),
                    ],
                  )
              )
            ],
          ),
        ),
      )
    );
  }

  void _registerUser() {
    setState(() {
      _loading = true;
      _message = null;
    });
    _viewModel.create(body: {
      'email': emailController.text,
      'first_name': firstNameController.text,
      'last_name': lastNameController.text,
      'alias': usernameController.text,
      'mobileno': mobileController.text,
      'pin': pinController.text,
      'confirmPin': passwordConfirmationController.text,
    });
  }

  void subscribeToViewModel() {
    _viewModel.getRegisteredUser()
        .listen((NetworkResponse response) {
      setState(() => {
        _loading = false,
      });
      if(response.isSuccessful) {
        Fluttertoast.showToast(msg: 'Registration successful.');
        Navigator.pushReplacementNamed(context, AppRoutes.appRouteRegistrationSuccessful);
      } else {
        const JsonDecoder decoder = JsonDecoder();
        try {
          final Map<String, dynamic> res = decoder.convert(
              response.error ?? '');
          if(res.containsKey('error')) {
            setState(() => _message = res['error']);
          } else {
            setState(() => _errors = res);
          }
        } on Exception catch (e) {
          setState(() => _message = response.error);
        }
      }

      // setState(() => _loading = false);

      //
      //   print({ 'e': response.error});
      //   // try {
      //   //   final Map<String, dynamic> res = _decoder.convert(response.error ?? '');
      //   //   print(res);
      //   //   setState(() => _errors = res);
      //   // } on Exception catch(e) {
      //   //   setState(() => _message = response.error);
      //   // }
      //
      // }
    });
  }

}