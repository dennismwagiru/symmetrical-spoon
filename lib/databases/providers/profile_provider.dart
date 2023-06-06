import 'package:flutter/cupertino.dart';
import 'package:tuntigi/app/app.dart';
import 'package:tuntigi/databases/app_database.dart';
import 'package:tuntigi/models/profile.dart';
import 'package:tuntigi/viewmodels/user_viewmodel.dart';

class ProfileProvider extends ChangeNotifier {
  late Profile? _profile = null;
  bool _isInitial = true;
  final UserViewModel _viewModel = UserViewModel(const App());
  final AppDatabase _appDatabase = const App().getAppDatabase();

  ProfileProvider() {
    _prefetch();
  }

  _prefetch() async {

    if(_isInitial) {
      await _appDatabase.isDatabaseReady;
      _appDatabase.getPlayerProfile()
          .then((Profile? profile) {
        _profile = profile;
        notifyListeners();
      });
    }

    _viewModel.getPlayerProfile(refresh: true)
        .then((Profile? profile) {
      _profile = profile;
      notifyListeners();
      _isInitial = false;
    });

  }


  Profile? get profile => _profile;

  set profile(Profile? profile) {
    if(profile != null) {
      _profile = profile;
    }
  }
}