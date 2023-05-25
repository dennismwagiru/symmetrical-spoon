import 'package:flutter/material.dart';
import 'package:tuntigi/utils/colors.dart';
import 'package:tuntigi/utils/custom_style.dart';

class TextInputWidget extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType? textInputType;
  final Widget? suffix;
  final Widget? prefix;
  const TextInputWidget({
    Key? key,
    required this.label,
    required this.controller,
    this.textInputType,
    this.suffix,
    this.prefix
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TextInputWidget();
}

class _TextInputWidget extends State<TextInputWidget> {


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: CustomStyle.inputFieldStyle,
      controller: widget.controller,
      keyboardType: widget.textInputType ?? TextInputType.text,
      validator: (value) {
        if(value == null || value.isEmpty){
          return "Please fill this field";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: widget.label,
          // contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          floatingLabelAlignment: FloatingLabelAlignment.start,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelStyle: CustomStyle.labelTextStyle,
          border: CustomStyle.focusBorder,
          focusedBorder: CustomStyle.focusBorder,
          enabledBorder: CustomStyle.focusErrorBorder,
          focusedErrorBorder: CustomStyle.focusErrorBorder,
          errorBorder: CustomStyle.focusErrorBorder,
          suffixIcon: widget.suffix,
          prefixIcon: widget.prefix
      ),
    );
  }

}