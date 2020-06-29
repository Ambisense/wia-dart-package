import 'dart:async';
import 'dart:convert' as convert;
import 'dart:io';
import 'package:http/http.dart' as http;

// import local files
import './src/resources/access_token.dart';
import './src/resources/user.dart';
import './src/resources/exceptions.dart';
import './src/resources/device.dart';
import './src/resources/space.dart';

// export classes to the public
export './src/resources/access_token.dart';
export './src/resources/user.dart';
export './src/resources/exceptions.dart';
export './src/resources/device.dart';
export './src/resources/space.dart';

class Wia {
  final _baseUri = "https://api.wia.io/v1";
  String _clientKey = null;
  String _accessToken = null;

  Wia(String clientKey, {String accessToken = null}) {
    _clientKey = clientKey;
    _accessToken = accessToken;
  }

  Map<String, String> getClientHeaders() {
    var map = {'x-client-key': _clientKey};
    if (_accessToken != null) {
      map['Authorization'] = 'Bearer ' + _accessToken;
    }
    return map;
  }

  Future<AccessToken> login(String username, String password) async {
    var response = await http.post(_baseUri + "/auth/token",
        body: {
          'username': username,
          'password': password,
          'scope': 'user',
          'grantType': 'password'
        },
        headers: getClientHeaders());

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var accessToken = AccessToken.fromJson(jsonResponse);
      _accessToken = accessToken.token;
      return accessToken;
    } else {
      var jsonResponse = convert.jsonDecode(response.body);
      throw new WiaHttpException(response.statusCode, jsonResponse["message"]);
    }
  }

  Future<User> retrieveUserMe() async {
    var response =
        await http.get(_baseUri + "/users/me", headers: getClientHeaders());

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var user = User.fromJson(jsonResponse);
      return user;
    } else {
      var jsonResponse = convert.jsonDecode(response.body);
      throw new WiaHttpException(response.statusCode, jsonResponse["message"]);
    }
  }

  Future<List<Space>> listSpaces() async {
    var response =
        await http.get(_baseUri + "/spaces", headers: getClientHeaders());

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
      List<dynamic> spacesData = jsonResponse["spaces"];
      return spacesData.map((spaceJson) => Space.fromJson(spaceJson)).toList();
    } else {
      var jsonResponse = convert.jsonDecode(response.body);
      throw new WiaHttpException(response.statusCode, jsonResponse["message"]);
    }
  }
}
