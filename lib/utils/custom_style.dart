import 'package:flutter/material.dart';

import 'colors.dart';
import 'dimensions.dart';

class CustomStyle {

  static var balanceAmountStyle = const TextStyle(
    color: Colors.black,
    fontSize: 50,
    fontWeight: FontWeight.w700,
    fontFamily: 'Circular',
  );

  static var currencyStyle = const TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.w700,
    fontFamily: 'Circular',
  );

  static var walletAccountBalanceStyle = const TextStyle(
      color: Color(0xFFAEAEAE),
      fontSize: 13,
      fontFamily: 'Circular',
      fontWeight: FontWeight.w400
  );

  static var titleStyle = const TextStyle(
      color: Colors.black,
      fontSize: 22,
      fontWeight: FontWeight.w600
  );

  static var greetingStyle = const TextStyle(
      color: CustomColor.titleGreyColor,
      fontSize: 19,
      fontWeight: FontWeight.w700,
      fontFamily: 'Circular'
  );
  static var designationStyle = const TextStyle(
      color: CustomColor.designationGreyColor,
      fontSize: 11,
      fontWeight: FontWeight.w400,
      fontFamily: 'Circular'
  );

  static var subTitleStyle = const TextStyle(
      color: CustomColor.subTitleGreyColor,
      fontSize: 12,
      fontWeight: FontWeight.w400
  );

  static var inputFieldStyle = TextStyle(
      color: CustomColor.greyColor,
      fontSize: Dimensions.defaultTextSize
  );

  static var textStyle = TextStyle(
      color: CustomColor.greyColor,
      fontSize: Dimensions.defaultTextSize
  );

  static var labelTextStyle = const TextStyle(
    color: Colors.black,
    fontSize: 10,
    fontWeight: FontWeight.w300,
    letterSpacing: 0.02,
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
    borderSide: BorderSide(color: Colors.black.withOpacity(0.1), width: 1.0),
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