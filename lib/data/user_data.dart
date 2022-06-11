class AppData {
  static final AppData _appData = new AppData._internal();

  String userId;
  String avatar = 'offline.png';
  String userName;
  String userEmail;
  String userPassword;
  dynamic message;

  factory AppData() {
    return _appData;
  }
  AppData._internal();
}

final appData = AppData();
