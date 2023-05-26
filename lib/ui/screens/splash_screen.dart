import 'dart:async';

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:tuntigi/app/app.dart';
import 'package:tuntigi/app/app_routes.dart';
import 'package:tuntigi/network/entities/response.dart';
import 'package:tuntigi/ui/widgets/common/logo_widget.dart';
import 'package:tuntigi/utils/colors.dart';
import 'package:tuntigi/viewmodels/user_viewmodel.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {

  late UserViewModel _viewModel;

  @override
  void initState() {
    _viewModel = UserViewModel(const App());
    _viewModel.isUserLoggedIn();

    print({'event': 'event'});

    super.initState();

    subscribeToViewModel();
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
            LogoWidget(size: 280,),
          ],
        ),
      ),
    );
  }

  void subscribeToViewModel() {
    _viewModel.getIsLoggedIn()
        .listen((bool event) {
          Timer(const Duration(seconds: 3), () {
            if(event) {
              Navigator.pushReplacementNamed(context, AppRoutes.appRouteDashboard);
            } else {
              Navigator.pushReplacementNamed(context, AppRoutes.appRouteLogin);

            }
          });

    });
  }

}