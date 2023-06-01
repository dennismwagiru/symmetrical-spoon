import 'package:flutter/cupertino.dart';
import 'package:tuntigi/app/app.dart';
import 'package:tuntigi/databases/app_database.dart';
import 'package:tuntigi/models/profile.dart';
import 'package:tuntigi/viewmodels/user_viewmodel.dart';

class ProfileProvider extends ChangeNotifier {
  late Profile? _profile = null;
  final UserViewModel _viewModel = UserViewModel(const App());
  final AppDatabase _appDatabase = App().getAppDatabase();

  ProfileProvider() {
    _appDatabase.isDatabaseReady.then((value) => {
      _appDatabase.getPlayerProfile().then((Profile? profile) {
        _profile = profile;
        notifyListeners();
      })
    });
  }


  Profile? get profile => _profile;

  set profile(Profile? profile) {
    if(profile != null) {
      _profile = profile;
      _appDatabase.isDatabaseReady.then((value) {
        _appDatabase.savePlayerProfile(profile: profile);
        notifyListeners();
      });

    }
  }
}