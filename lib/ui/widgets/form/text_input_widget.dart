import 'package:flutter/material.dart';
import 'package:tuntigi/utils/colors.dart';
import 'package:tuntigi/utils/custom_style.dart';

class TextInputWidget extends StatelessWidget {
  final String label;
  final Widget? suffix;
  const TextInputWidget({Key? key, required this.label, required this.suffix}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: CustomStyle.inputFieldStyle,
      // validator: (String value){
      //   if(value.isEmpty){
      //     return Strings.pleaseFillOutTheField;
      //   }else{
      //     return null;
      //   }
      // },
      decoration: InputDecoration(
          labelText: label,
          // contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          floatingLabelAlignment: FloatingLabelAlignment.start,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelStyle: CustomStyle.labelTextStyle,
          filled: true,
          fillColor: Colors.white,
          border: CustomStyle.focusBorder,
          focusedBorder: CustomStyle.focusBorder,
          enabledBorder: CustomStyle.focusErrorBorder,
          focusedErrorBorder: CustomStyle.focusErrorBorder,
          errorBorder: CustomStyle.focusErrorBorder,
          suffixIcon: suffix
      ),
    );
  }

}