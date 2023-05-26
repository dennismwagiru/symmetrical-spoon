import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final double? size;
  const LogoWidget({Key? key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logo.png',
      fit: BoxFit.cover,
      height: size ?? 78.65,
      width: size ?? 80,
    );
  }

}