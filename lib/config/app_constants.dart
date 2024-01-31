class AppConstants {
  // API constants
  static const String baseUrl = 'https://peanut.ifxdb.com';
  static const String login =
      '$baseUrl/api/ClientCabinetBasic/IsAccountCredentialsCorrect';
  static const String getTrades =
      '$baseUrl/api/ClientCabinetBasic/GetOpenTrades';
  static const String getAccountInfo =
      '$baseUrl/api/ClientCabinetBasic/GetAccountInformation';
  // hive constants

  // Box Names
  static const String authBox = 'laundrySeller_authBox';
  static const String userBox = 'laundrySeller_userBox';

  // Settings Veriable Names
  static const String appLocal = 'appLocal';
  static const String isDarkTheme = 'isDarkTheme';

  // Auth Variable Names
  static const String authToken = 'token';

  // User Variable Names
  static const String userData = 'userData';

  static String appCurrency = "\$";
}
