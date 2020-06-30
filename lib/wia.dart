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

  void logout() async {
    _accessToken = null;
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

  Future<List<Space>> listSpaces({int limit = 80}) async {
    var queryString = "limit=" + limit.toString();

    var response = await http.get(_baseUri + "/spaces?" + queryString,
        headers: getClientHeaders());

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
      print(jsonResponse);
      List<dynamic> spacesData = jsonResponse["spaces"];
      return spacesData.map((spaceJson) => Space.fromJson(spaceJson)).toList();
    } else {
      var jsonResponse = convert.jsonDecode(response.body);
      throw new WiaHttpException(response.statusCode, jsonResponse["message"]);
    }
  }

  Future<Space> retrieveSpace(String id) async {
    var response =
        await http.get(_baseUri + "/spaces/" + id, headers: getClientHeaders());

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var space = Space.fromJson(jsonResponse);
      return space;
    } else {
      var jsonResponse = convert.jsonDecode(response.body);
      throw new WiaHttpException(response.statusCode, jsonResponse["message"]);
    }
  }

  Future<List<Device>> listDevices(String spaceId,
      {int limit = 40, int page = 1}) async {
    var response = await http.get(_baseUri + "/devices?space.id=" + spaceId,
        headers: getClientHeaders());

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
      List<dynamic> devicesData = jsonResponse["devices"];
      return devicesData
          .map((deviceJson) => Device.fromJson(deviceJson))
          .toList();
    } else {
      var jsonResponse = convert.jsonDecode(response.body);
      throw new WiaHttpException(response.statusCode, jsonResponse["message"]);
    }
  }

  Future<Device> retrieveDevice(String id) async {
    var response = await http.get(_baseUri + "/devices/" + id,
        headers: getClientHeaders());

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var device = Device.fromJson(jsonResponse);
      return device;
    } else {
      var jsonResponse = convert.jsonDecode(response.body);
      throw new WiaHttpException(response.statusCode, jsonResponse["message"]);
    }
  }
}
