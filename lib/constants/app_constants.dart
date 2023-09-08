class AppConstants {

  //API Params
  static const String userName = 'userName';
  static const String domainSplit = "/";
  static const String name = 'name';
  static const String givenName = 'givenName';
  static const String familyName = 'familyName';
  static const String wso2Schema = 'urn:scim:wso2:schema';
  static const String dob = 'dateOfBirth';
  static const String country = 'country' ;
  static const String phoneNumbers = 'phoneNumbers';
  static const String type = 'type';
  static const String mobile = 'mobile';
  static const String value = 'value';
  static const String photo = 'photoUrl';

//http responses
  static const int httpSuccessCode = 200;
  static const int httpUnauthorizedCode = 401;

//page indexes
  static const int firstPage = 1;
  static const int homePage = 2;
  static const int profilePage = 3;
  static const int externalAPIResponsePage = 4;
  static const int editProfilePage = 5;

}

class AuthConstants {

  static const String login = 'login';
  static const String openidScope = 'openid';
  static const String address = 'address';
  static const String profile = 'profile';
  static const String phone = 'phone';
  static const String internalLoginScope = 'internal_login';

}

class APIClientConstants {

  static const String authorization = 'Authorization';
  static const String bearer = 'Bearer';
  static const String contentType = 'Content-Type';
  static const String contentTypeJson = 'application/scim+json';
}

class ProviderConstants {

  static const String pageIndex = "pageIndex";
  static const String isUserLoggedIn = "isUserLoggedIn";
  static const String apiData = "apiData";
  static const String firstName = "firstName";
  static const String lastName = "lastName";
  static const String dateOfBirth = "dateOfBirth";
  static const String country = "country";
  static const String mobile = "mobile";
  static const String photo = "photo";
  static const String accessToken = "accessToken";
  static const String idToken = "idToken";
  static const String refreshToken = "refreshToken";
  static const String userName = "userName";

}

class WarningMessages {

  static const String refreshTokenIssue = "Issue in renewing access token. User needs to login again.";
  static const String logOutIssue = "Issue in ending user session. User session may have already expired.";
}