import 'package:flutter/cupertino.dart';
import 'package:tuntigi/app/app.dart';
import 'package:tuntigi/databases/app_database.dart';
import 'package:tuntigi/models/profile.dart';
import 'package:tuntigi/network/nao/user_nao.dart';
import 'package:tuntigi/viewmodels/user_viewmodel.dart';

class ProfileProvider extends ChangeNotifier {
  late Profile? _profile = null;
  final UserViewModel _viewModel = UserViewModel(const App());
  final AppDatabase _appDatabase = const App().getAppDatabase();

  ProfileProvider() {
    _prefetch();
  }

  _prefetch() async {

    await _appDatabase.isDatabaseReady;
    _appDatabase.getPlayerProfile()
        .then((Profile? profile) {
      _profile = profile;
      print(profile);
      notifyListeners();
    });
  }

  loadFromNetwork() async {
    return _viewModel.getPlayerProfile(refresh: true)
        .then((Profile? profile) {
      _prefetch();
    }).then((value) => UserNAO.saveDeviceToken());
  }


  Profile? get profile => _profile;

  set profile(Profile? profile) {
    _profile = profile;
  }
}