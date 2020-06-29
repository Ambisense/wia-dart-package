import 'package:wia_dart_package/wia.dart';

void main() async {
  var appKey = "your_wia_app_key";
  var accessToken = "your_wia_access_token";

  Wia wia = new Wia(appKey, accessToken: accessToken);

  // User class is exported from `main.dart` file
  AccessToken accessTokenRequest = await wia.login("testdd@wia.io", 'password');

  print("User ${accessTokenRequest.token} ");
}
