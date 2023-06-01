import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:tuntigi/app/app.dart';
import 'package:tuntigi/app/app_routes.dart';
import 'package:tuntigi/databases/providers/profile_provider.dart';
import 'package:tuntigi/models/profile.dart';
import 'package:tuntigi/ui/widgets/bottom_nav_bar.dart';
import 'package:tuntigi/ui/widgets/common/balance_widget.dart';
import 'package:tuntigi/ui/widgets/dashboard_grid_view.dart';
import 'package:tuntigi/ui/widgets/profile/profile_header_widget.dart';
import 'package:tuntigi/viewmodels/user_viewmodel.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() =>
      _DashboardScreen();
}

class _DashboardScreen extends State<DashboardScreen> {

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  GlobalKey<RefreshIndicatorState>();

  late UserViewModel _viewModel;

  @override
  void initState() {
    _viewModel = UserViewModel(const App());

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);

    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Scaffold(
          bottomNavigationBar: const BottomNavBar(index: 0),
          body: Padding(
            padding: const EdgeInsets.only(
                left: 30.0,
                top: 30.0,
                right: 30.0
            ),
            // child: DashboardGridView()
            child: RefreshIndicator(
              key: _refreshIndicatorKey,
              onRefresh: () =>
                  _viewModel.getPlayerProfile(refresh: true)
                      .then((Profile? profile) {
                        if(profile == null) {
                          Fluttertoast.showToast(msg: "Session expired, Please login again to continue.");
                          Navigator.pushReplacementNamed(context, AppRoutes.appRouteLogin);
                        } else {
                          profileProvider.profile = profile;
                        }
                    return;
                  })
              ,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    ProfileHeaderWidget(),
                    SizedBox(height: 44,),
                    BalanceWidget(),
                    DashboardGridView(),
                  ]
              ),
            ),
          ),
        )
    );
  }

  _fetchProfile() {
    ;
  }
}
