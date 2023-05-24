import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class AppPreferences {

  //----------------------- Preference Constants -----------------------//
  // Constants for Preference-Value's data-type
  static const String prefTypeBool    = 'BOOL';
  static const String prefTypeInteger = 'INTEGER';
  static const String prefTypeDouble  = 'DOUBLE';
  static const String prefTypeString  = 'STRING';

  // Constants for Preference-Name
  static const String prefIsInitial  = 'IS_INITIAL_LAUNCH';
  static const String prefIsLoggedIn  = 'IS_LOGGED_IN';
  static const String prefUserId  = 'USER_ID';
  static const String prefAccessToken = 'ACCESS_TOKEN';
  static const String prefStartTime = 'START_TIME';
  static const String prefEndTime = 'END_TIME';
  static const String prefMobile = 'MOBILE';

  static const String prefVTypesLastSavedAt = 'V_TYPES_LAST_SAVED';

  //----------------------- Variables -----------------------//
  // Future variable to check SharedPreference Instance is ready
  // This is actually a hack. As constructor is not allowed to have 'async' we cant 'await' for future value
  // SharedPreference.getInstance() returns Future<SharedPreference> object and we want to assign its value to our private _preference variable
  // In case if we don't 'await' for SharedPreference.getInstance() method, and in mean time if we access preferences using _preference variable we will get
  // NullPointerException for _preference variable, as it isn't yet initialized.
  // We need to 'await' _isPreferenceReady value for only once when preferences are first time requested in application lifecycle because in further
  // future requests, preference instance is already ready as we are using Singleton-Instance.
  late Future _isPreferenceInstanceReady;

  // Private variable for SharedPreferences
  late SharedPreferences _preferences;

  //----------------------- Singleton -----------------------//
  // Final static instance of class initialized by private constructor
  static final AppPreferences _instance = AppPreferences._internal();
  // Factory Constructor
  factory AppPreferences () => _instance;

  /// AppPreference Private Internal Constructor -> AppPreference
  /// @param->_
  /// @usage-> Initialize
  AppPreferences._internal() {
    _isPreferenceInstanceReady = SharedPreferences.getInstance().then((preferences)=> _preferences = preferences);
  }

  //----------------------- Getter Methods -----------------------//
  // Getter for isPreferenceReady future
  Future get isPreferenceReady => _isPreferenceInstanceReady;

  //----------------------- Public Preference Methods -----------------------//

  /// Set Logged-In Method -> void
  /// @param -> @required isLoggedIn -> bool
  /// @usage -> Set value of IS_LOGGED_IN in preferences
  void setInitial({required bool isInitial}) => _setPreference(prefName: prefIsInitial, prefValue: isInitial, prefType: prefTypeBool);
  void setLoggedIn({required bool isLoggedIn}) => _setPreference(prefName: prefIsLoggedIn, prefValue: isLoggedIn, prefType: prefTypeBool);
  void setUserId({required String userId}) => _setPreference(prefName: prefUserId, prefValue: userId, prefType: prefTypeString);
  void setStartTime({required String? startTime}) => _setPreference(prefName: prefStartTime, prefValue: startTime, prefType: prefTypeString);
  void setEndTime({required String? endTime}) => _setPreference(prefName: prefEndTime, prefValue: endTime, prefType: prefTypeString);
  void setMobile({required String? mobile}) => _setPreference(prefName: prefMobile, prefValue: mobile, prefType: prefTypeString);
  void setVTypesLastSavedAt({required int lastSavedAt}) => _setPreference(prefName: prefVTypesLastSavedAt, prefValue: lastSavedAt, prefType: prefTypeInteger);

  void clear() => _preferences.clear();

  /// Get Logged-In Method -> Future<bool>
  /// @param -> _
  /// @usage -> Get value of IS_LOGGED_IN from preferences
  Future<bool> getInitialLaunch() async => await _getPreference(prefName: prefIsInitial) ?? true; // Check value for Null. If Null  provide default value as True.
  Future<bool> getLoggedIn() async => await _getPreference(prefName: prefIsLoggedIn) ?? false; // Check value for Null. If Null  provide default value as False.
  Future<String?> getUserId() async => await _getPreference(prefName: prefUserId); // Check value for Null. If Null  provide default value as False.
  Future<String?> getStartTime() async => await _getPreference(prefName: prefStartTime);
  Future<String?> getEndTime() async => await _getPreference(prefName: prefEndTime);
  Future<String?> getMobile() async => await _getPreference(prefName: prefMobile);

  Future<int?> getVTypesLastSavedAt() async => await _getPreference(prefName: prefVTypesLastSavedAt);

  /// Set Access-Token Method -> void
  /// @param -> @required accessToken -> bool
  /// @usage -> Set value of ACCESS_TOKEN in preferences
  void setAccessToken({required String accessToken}) => _setPreference(prefName: prefAccessToken, prefValue: accessToken, prefType: prefTypeString);

  /// Get Access-Token Method -> Future<String>
  /// @param -> _
  /// @usage -> Get value of ACCESS_TOKEN from preferences
  Future<String?> getAccessToken() async {
    return await _getPreference(prefName: prefAccessToken);
  }

  //----------------------- Private Preference Methods -----------------------//
  /// Set Preference Method -> void
  /// @param -> @@required prefName -> String
  ///        -> @required prefValue -> dynamic
  ///        -> @required prefType -> String
  /// @usage -> This is a generalized method to set preferences with @required Preference-Name(Key) with Preference-Value(Value) and Preference-Value's data-type.
  void _setPreference ({required String prefName, required dynamic prefValue, required String prefType}){
    // Make switch for Preference Type i.e Preference-Value's data-type
    switch(prefType){
    // prefType is bool
      case prefTypeBool:{
        _preferences.setBool(prefName, prefValue);
        break;
      }
    // prefType is int
      case prefTypeInteger:{
        _preferences.setInt(prefName, prefValue);
        break;
      }
    // prefType is double
      case prefTypeDouble:{
        _preferences.setDouble(prefName, prefValue);
        break;
      }
    // prefType is String
      case prefTypeString:{
        if(prefValue == null) {
          _preferences.remove(prefName);
        } else {
          _preferences.setString(prefName, prefValue);
        }
        break;
      }
    }
  }

  /// Get Preference Method -> Future<dynamic>
  /// @param -> @required prefName -> String
  /// @usage -> Returns Preference-Value for given Preference-Name
  Future<dynamic> _getPreference({required prefName}) async => _preferences.get(prefName);

}