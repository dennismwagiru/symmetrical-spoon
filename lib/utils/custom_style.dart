import 'package:flutter/material.dart';

import 'colors.dart';
import 'dimensions.dart';

class CustomStyle {

  static var balanceAmountStyle = TextStyle(
    color: Colors.black,
    fontSize: 50,
    fontWeight: FontWeight.w700,
  );

  static var currencyStyle = TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );

  static var walletAccountBalanceStyle = TextStyle(
    color: Colors.grey,
    fontSize: 18
  );

  static var titleStyle = TextStyle(
      color: Colors.black,
      fontSize: Dimensions.extraLargeTextSize
  );

  static var subTitleStyle = TextStyle(
      color: Colors.black,
      fontSize: Dimensions.largeTextSize
  );

  static var textStyle = TextStyle(
      color: CustomColor.greyColor,
      fontSize: Dimensions.defaultTextSize
  );

  static var hintTextStyle = TextStyle(
      color: Colors.grey.withOpacity(0.5),
      fontSize: Dimensions.defaultTextSize
  );

  static var listStyle = TextStyle(
      color: Colors.black,
      fontSize: Dimensions.defaultTextSize
  );

  static var defaultStyle = TextStyle(
      color: Colors.black,
      fontSize: Dimensions.largeTextSize
  );

  static var focusBorder = OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
    borderSide: BorderSide(color: Colors.black.withOpacity(0.1), width: 2.0),
  );

  static var focusErrorBorder = OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
    borderSide: BorderSide(color: Colors.black.withOpacity(0.1), width: 1.0),
  );

  static var searchBox = OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide(color: Colors.black.withOpacity(0.1), width: 1.0),
  );
}