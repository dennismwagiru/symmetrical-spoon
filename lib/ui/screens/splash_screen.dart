import 'dart:async';

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:tuntigi/app/app_routes.dart';
import 'package:tuntigi/ui/widgets/common/logo_widget.dart';
import 'package:tuntigi/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, AppRoutes.appRouteLogin);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            LogoWidget(),
          ],
        ),
      ),
    );
  }

}