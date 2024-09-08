
class Urls {
  static const String protocol = 'http';
  static const String host = '10.0.2.2:8000';
  // static const String host = 'localhost:8000';

  static const String myTeamListUrl = '/v1/teams/joined/';
  static const String createTeamUrl = '/v1/teams/create/';
  static const String tokenRefleshUrl = '/v1/users/token/refresh/';

  static String get baseUrl => '$protocol://$host';
}
