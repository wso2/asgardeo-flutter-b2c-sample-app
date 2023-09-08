import 'configs.dart';

const discoveryUrl =
    'https://api.asgardeo.io/t/$organizationName/oauth2/token/.well-known/openid-configuration';
const userInfoEndpoint = 'https://api.asgardeo.io/t/$organizationName/oauth2/userinfo';
const meEndpoint = 'https://api.asgardeo.io/t/$organizationName/scim2/Me';
const signUpUrl = 'https://accounts.asgardeo.io/t/$organizationName/accountrecoveryendpoint/register.do?client_id=$clientId&sp=$spName&redirect_url=$redirectUrl';