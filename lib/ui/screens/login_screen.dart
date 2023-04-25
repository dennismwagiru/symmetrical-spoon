import 'package:flutter/material.dart';
import 'package:tuntigi/app/app_routes.dart';
import 'package:tuntigi/ui/widgets/loadable_widget.dart';
import 'package:tuntigi/utils/colors.dart';
import 'package:tuntigi/utils/custom_style.dart';
import 'package:tuntigi/utils/dimensions.dart';
import 'package:tuntigi/utils/strings.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _loading = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
              loginWidget(context)
            ],
          ),
      ),
    );
  }

  Widget loginWidget(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: Dimensions.defaultPaddingSize, right: Dimensions.defaultPaddingSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
                Strings.welcomeBack,
                style: CustomStyle.titleStyle
            ),
            const SizedBox(height: Dimensions.heightSize * 2,),
            Text(
                Strings.signInToYourAccount,
                style: CustomStyle.subTitleStyle
            ),
            const SizedBox(height: Dimensions.heightSize * 2,),
            Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      style: CustomStyle.textStyle,
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      // validator: (String value){
                      //   if(value.isEmpty){
                      //     return Strings.pleaseFillOutTheField;
                      //   }else{
                      //     return null;
                      //   }
                      // },
                      decoration: InputDecoration(
                        labelText: Strings.phoneNumber,
                        contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                        labelStyle: CustomStyle.textStyle,
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        filled: true,
                        fillColor: Colors.white,
                        hintStyle: CustomStyle.textStyle,
                        border: CustomStyle.focusBorder,
                        focusedBorder: CustomStyle.focusBorder,
                        enabledBorder: CustomStyle.focusErrorBorder,
                        focusedErrorBorder: CustomStyle.focusErrorBorder,
                        errorBorder: CustomStyle.focusErrorBorder,
                      ),
                    ),
                    SizedBox(height: Dimensions.heightSize,),
                    TextFormField(
                      style: CustomStyle.textStyle,
                      controller: passwordController,
                      // validator: (String value){
                      //   if(value.isEmpty){
                      //     return Strings.pleaseFillOutTheField;
                      //   }else{
                      //     return null;
                      //   }
                      // },
                      decoration: InputDecoration(
                        labelText: Strings.pin,
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                        labelStyle: CustomStyle.textStyle,
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        focusedBorder: CustomStyle.focusBorder,
                        enabledBorder: CustomStyle.focusErrorBorder,
                        focusedErrorBorder: CustomStyle.focusErrorBorder,
                        errorBorder: CustomStyle.focusErrorBorder,
                        prefixIcon: const Icon(Icons.lock),
                        filled: true,
                        fillColor: Colors.white,
                        hintStyle: CustomStyle.textStyle,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _toggleVisibility = !_toggleVisibility;
                            });
                          },
                          icon: _toggleVisibility
                              ? Icon(
                            Icons.visibility_off,
                            color: Colors.black,
                          )
                              : Icon(
                            Icons.visibility,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      obscureText: _toggleVisibility,
                    ),
                    SizedBox(height: Dimensions.heightSize),
                  ],
                )
            ),
            SizedBox(height: Dimensions.heightSize),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                Strings.forgotPin,
                style: CustomStyle.textStyle,
                textAlign: TextAlign.end,
              ),
            ),
            SizedBox(height: Dimensions.heightSize * 3),
            LoadableWidget(
                loading: _loading,
                widget: GestureDetector(
                  child: Container(
                    height: 50.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: CustomColor.primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius))
                    ),
                    child: Center(
                      child: Text(
                        Strings.signIn,
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
                )
            ),
            SizedBox(height: Dimensions.heightSize * 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Strings.dontHaveAccount,
                  style: TextStyle(
                      fontSize: Dimensions.defaultTextSize
                  ),
                ),
                GestureDetector(
                  child: Text(
                    Strings.signUp,
                    style: TextStyle(
                        fontSize: Dimensions.defaultTextSize,
                        color: CustomColor.primaryColor,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed(AppRoutes.appRouteRegister);
                  },
                ),
              ],
            )
          ],
        )
    );
  }

}