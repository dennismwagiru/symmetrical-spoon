import 'package:flutter/material.dart';
import 'package:tuntigi/utils/colors.dart';
import 'package:tuntigi/utils/custom_style.dart';
import 'package:tuntigi/utils/strings.dart';

class PasswordInputWidget extends StatefulWidget {
  final String label;
  const PasswordInputWidget({Key? key, required this.label}) : super(key: key);

  State<StatefulWidget> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInputWidget> {
  bool _toggleVisibility = true;

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
          labelText: widget.label,
          // contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          floatingLabelAlignment: FloatingLabelAlignment.start,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelStyle: CustomStyle.labelTextStyle,
          focusedBorder: CustomStyle.focusBorder,
          enabledBorder: CustomStyle.focusErrorBorder,
          focusedErrorBorder: CustomStyle.focusErrorBorder,
          errorBorder: CustomStyle.focusErrorBorder,
          prefixIcon: const Icon(Icons.lock),
          filled: true,
          fillColor: Colors.white,
          suffixIcon: Padding(
            padding: const EdgeInsetsDirectional.only(
                end: 11,
                top: 5,
                bottom: 4
            ),
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 27),
                backgroundColor: CustomColor.lightBlueColor,
                side: const BorderSide(width: 1.0, color: CustomColor.accentColor),
                textStyle: TextStyle(
                  color: CustomColor.accentColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  fontFamily: 'Inter'
                )
              ),
              child: Text(Strings.view),
            ), // myIcon is a 48px-wide widget.
          )
        // suffixIcon: IconButton(
        //   onPressed: () {
        //     setState(() {
        //       _toggleVisibility = !_toggleVisibility;
        //     });
        //   },
        //   icon: Icon(
        //     _toggleVisibility ? Icons.visibility_off : Icons.visibility,
        //     color: CustomColor.blueColor,
        //   )
        // ),
      ),
      obscureText: _toggleVisibility,
    );
  }

}