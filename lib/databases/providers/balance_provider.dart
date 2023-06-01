import 'package:flutter/cupertino.dart';
import 'package:tuntigi/app/app.dart';

class ShowBalanceProvider extends ChangeNotifier {
  late bool _showBalance = false;
  var preferences = const App().getAppPreferences();

  ShowBalanceProvider() {
    preferences.isPreferenceReady.then((value) {
      preferences.getShowBalance().then((value){
        _showBalance = value;
        notifyListeners();
      });
    });
  }


  bool get showBalance => _showBalance;

  set showBalance(bool showBalance) {
    _showBalance = showBalance;
    preferences.setShowBalance(showBalance: showBalance);
    notifyListeners();
  }
}