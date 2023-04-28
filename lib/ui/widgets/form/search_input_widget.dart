import 'package:flutter/material.dart';
import 'package:tuntigi/utils/colors.dart';
import 'package:tuntigi/utils/custom_style.dart';

class SearchInputWidget extends StatelessWidget {
  final String label;
  const SearchInputWidget({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w400,
          fontFamily: 'Circular'
      ),
      // validator: (String value){
      //   if(value.isEmpty){
      //     return Strings.pleaseFillOutTheField;
      //   }else{
      //     return null;
      //   }
      // },
      decoration: InputDecoration(
        hintText: label,
        // contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        border: CustomStyle.focusBorder,
        focusedBorder: CustomStyle.focusBorder,
        enabledBorder: CustomStyle.focusErrorBorder,
        focusedErrorBorder: CustomStyle.focusErrorBorder,
        errorBorder: CustomStyle.focusErrorBorder,
        suffixIcon: const Icon(
            Icons.search_sharp
        ),
      ),
    );
  }

}