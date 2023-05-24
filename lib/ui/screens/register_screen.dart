import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:tuntigi/app/app_routes.dart';
import 'package:tuntigi/ui/widgets/form/password_input_widget.dart';
import 'package:tuntigi/ui/widgets/form/text_input_widget.dart';
import 'package:tuntigi/ui/widgets/loadable_widget.dart';
import 'package:tuntigi/utils/colors.dart';
import 'package:tuntigi/utils/custom_style.dart';
import 'package:tuntigi/utils/dimensions.dart';
import 'package:tuntigi/utils/strings.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _loading = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();

  bool _toggleVisibility = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.only(left: Dimensions.defaultPaddingSize, right: Dimensions.defaultPaddingSize),
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
                    Form(
                        key: formKey,
                        child: Column(
                          children: [
                            TextInputWidget(
                              label: Strings.username,
                              suffix: null,
                              controller: usernameController,
                            ),
                            const SizedBox(height: 26),
                            TextInputWidget(
                              label: Strings.fullName,
                              suffix: null,
                              controller: fullNameController,
                            ),
                            const SizedBox(height: 26),
                            TextInputWidget(
                              label: Strings.email,
                              controller: emailController,
                              textInputType: TextInputType.emailAddress,
                              suffix: const Icon(
                                Icons.check_circle,
                                color: CustomColor.blueColor,
                                size: 34,
                              ),
                            ),
                            const SizedBox(height: 26),
                            PasswordInputWidget(label: Strings.pin, controller: passwordController,),
                            const SizedBox(height: 26),
                            PasswordInputWidget(label: Strings.confirmPin, controller: passwordConfirmationController,),
                            const SizedBox(height: 95),
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
                            Navigator.pushReplacementNamed(context, AppRoutes.appRouteRegistrationSuccessful);
                          },
                        )
                    ),
                  ],
                )
            )
          ],
        ),
      ),
    );
  }

}