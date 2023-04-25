import 'package:flutter/material.dart';
import 'package:tuntigi/app/app_routes.dart';
import 'package:tuntigi/ui/widgets/loadable_widget.dart';
import 'package:tuntigi/utils/colors.dart';
import 'package:tuntigi/utils/custom_style.dart';
import 'package:tuntigi/utils/dimensions.dart';
import 'package:tuntigi/utils/strings.dart';

class RegistrationSuccessScreen extends StatefulWidget {
  const RegistrationSuccessScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RegistrationSuccessScreenState();
}

class _RegistrationSuccessScreenState extends State<RegistrationSuccessScreen> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                          Strings.signupSuccessful,
                          style: CustomStyle.titleStyle
                      ),
                      const SizedBox(height: Dimensions.heightSize * 2,),
                      Text(
                          Strings.signupSuccessfulDesc,
                          style: CustomStyle.subTitleStyle
                      ),
                      const SizedBox(height: Dimensions.heightSize * 2,),
                      GestureDetector(
                        child: Container(
                          height: 50.0,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: CustomColor.primaryColor,
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
                          Navigator.pushReplacementNamed(context, AppRoutes.appRouteHome);
                        },
                      )
                    ],
                  )
              )
            ],
          ),
      ),
    );
  }

}