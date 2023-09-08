import 'package:flutter/foundation.dart';

import '../constants/app_constants.dart';

class UserSession with ChangeNotifier, DiagnosticableTreeMixin{
  late String _accessToken = '';
  late String _idToken = '';
  late String _refreshToken = '';

  String get accessToken => _accessToken;

  String get idToken => _idToken;

  String get refreshToken => _refreshToken;

  void loginSuccessfulFunction(accessToken, idToken, refreshToken){
    _accessToken = accessToken;
    _idToken = idToken;
    _refreshToken = refreshToken;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty(ProviderConstants.accessToken, accessToken));
    properties.add(StringProperty(ProviderConstants.idToken, idToken));
    properties.add(StringProperty(ProviderConstants.refreshToken, refreshToken));
  }
}