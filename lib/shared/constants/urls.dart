
class Urls {
  static const String protocol = 'http';
  static const String host = '10.0.2.2:8000';
  // static const String host = 'localhost:8000';

  static const String myTeamListUrl = '/v1/teams/joined/';
  static const String createTeamUrl = '/v1/teams/create/';
  static const String tokenRefleshUrl = '/v1/users/token/refresh/';
  static const String loginUrl = '/v1/users/login/';
  static const String signUpUrl = '/v1/users/create/';
  static const String changeUsernameUrl = '/v1/users/change_name/';
  static String teamDetailUrl(String teamId) => '/v1/teams/detail/$teamId/';
  static String searchTeamUrl(String query) => '/v1/teams/?search=$query';

  static String get baseUrl => '$protocol://$host';

}
