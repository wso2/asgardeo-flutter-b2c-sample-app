import 'package:flutter/foundation.dart';

import '../configs/configs.dart';
import '../constants/app_constants.dart';

class User with ChangeNotifier, DiagnosticableTreeMixin{
  late String _firstName = '';
  late String _lastName = '';
  late String _dateOfBirth = '';
  late String _country = '';
  late String _mobile = '';
  late String _photo = '';
  late String _userName = '';

  String get firstName => _firstName;

  String get lastName => _lastName;

  String get dateOfBirth => _dateOfBirth;

  String get country => _country;

  String get mobile => _mobile;

  String get photo => _photo;

  String get userName => _userName;

  void setUserDetails(profile){
    _firstName = profile[AppConstants.name][AppConstants.givenName] ?? '';
    _lastName = profile[AppConstants.name][AppConstants.familyName] ?? '';
    _dateOfBirth = profile[AppConstants.wso2Schema][AppConstants.dob] ?? '';
    _country = profile[AppConstants.wso2Schema][AppConstants.country] ?? '';
    _mobile = profile[AppConstants.phoneNumbers][0][AppConstants.type] == AppConstants.mobile? profile[AppConstants.phoneNumbers][0][AppConstants.value]:'';
    _photo = profile[AppConstants.wso2Schema][AppConstants.photo] ?? defaultPhotoURL;
    notifyListeners();
  }

  void setUserName(profile){
    _userName = profile[AppConstants.userName].toString().split(AppConstants.domainSplit)[1];
    notifyListeners();
  }

  void clearUserData(){
    _userName = "";
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty(ProviderConstants.firstName, firstName));
    properties.add(StringProperty(ProviderConstants.lastName, lastName));
    properties.add(StringProperty(ProviderConstants.dateOfBirth, dateOfBirth));
    properties.add(StringProperty(ProviderConstants.country, country));
    properties.add(StringProperty(ProviderConstants.mobile, mobile));
    properties.add(StringProperty(ProviderConstants.photo, photo));
    properties.add(StringProperty(ProviderConstants.userName, userName));
  }
}