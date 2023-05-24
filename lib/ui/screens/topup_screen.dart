import 'package:flutter/material.dart';
import 'package:tuntigi/app/app_routes.dart';
import 'package:tuntigi/ui/widgets/form/text_input_widget.dart';
import 'package:tuntigi/utils/colors.dart';
import 'package:tuntigi/utils/custom_style.dart';
import 'package:tuntigi/utils/dimensions.dart';
import 'package:tuntigi/utils/strings.dart';

class TopUpScreen extends StatefulWidget {
  const TopUpScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TopUpScreen();
}

class _TopUpScreen extends State<TopUpScreen> {
  TextEditingController topUpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   leading: const Icon(
      //     Icons.arrow_back_sharp
      //   ),
      //   title: const Text(
      //     'Top Up'
      //   ),
      // ),
      body: SingleChildScrollView(
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
                      GestureDetector(
                          onTap: () { Navigator.pop(context); },
                          child: Row(
                            children: const [
                              Icon(
                                Icons.arrow_back_sharp,
                                weight: 60,
                              ),
                              Text(
                                'Top Up',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600
                                ),
                              )
                            ],
                          )
                      ),
                      const SizedBox(height: 97),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('My Balance'),
                      ),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                  Strings.currency.toUpperCase(),
                                  style: CustomStyle.currencyStyle
                              ),
                            ),
                            Text(
                              Strings.balanceAmount,
                              style: CustomStyle.balanceAmountStyle,
                            )
                          ]
                      ),
                      const SizedBox(height: 97),
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
                              Strings.confirm,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Dimensions.largeTextSize
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.pushReplacementNamed(context, AppRoutes.appRouteTopupSuccessful);
                        },
                      ),
                      const SizedBox(height: 56),
                    ],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
