import 'package:wia_dart_package/wia.dart';

void main() async {
  var appKey = "ck_HDUVdx2YZ2EqDNgD9vXR";
  // var accessToken = "your_wia_access_token";

  Wia wia = new Wia(appKey);

  // User class is exported from `main.dart` file
  try {
    AccessToken accessTokenRequest = await wia.login("test@wia.io", 'password');
    print("GOT ACCESS TOKEN!!!");
  } catch (err) {
    print(err);
  }
}
