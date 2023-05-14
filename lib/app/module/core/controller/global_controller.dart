class GlobalController {
  static final GlobalController _instance = GlobalController._internal();

  late String _accessToken, _langCode;

  factory GlobalController() => _instance;

  GlobalController._internal() {
    _accessToken = "";
    _langCode = "";
  }


  void setAccessToken(String token) => _accessToken = token;
  String getAccessToken() => _accessToken;

  void setLangCode(String langCode) => langCode = _langCode;
  String getLangCode() => _langCode;
}