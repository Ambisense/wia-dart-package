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
import './src/resources/organisation.dart';
import './src/resources/avatar.dart';
import 'src/resources/device_widget.dart';
import './src/resources/event.dart';

// export classes to the public
export './src/resources/access_token.dart';
export './src/resources/user.dart';
export './src/resources/exceptions.dart';
export './src/resources/device.dart';
export './src/resources/space.dart';
export './src/resources/organisation.dart';
export './src/resources/avatar.dart';
export 'src/resources/device_widget.dart';
export './src/resources/event.dart';

class Wia {
  final _baseUri = "https://api.wia.io/v1";
  String _clientKey = null;
  String _accessToken = null;

  Wia({String clientKey = null, String accessToken = null}) {
    _clientKey = clientKey;
    _accessToken = accessToken;
  }

  Map<String, String> getClientHeaders() {
    var map = {'x-client-key': _clientKey};
    if (_clientKey != null) {
      map['x-client-key'] = _clientKey;
    }
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

  Future<List<Device>> listDevices(
      {String spaceId, int limit = 40, int page = 1}) async {
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

  Future<List<Organisation>> listOrganisations({int limit = 80}) async {
    var queryString = "limit=" + limit.toString();

    var response = await http.get(_baseUri + "/organisations?" + queryString,
        headers: getClientHeaders());

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
      print(jsonResponse);
      List<dynamic> organisationsData = jsonResponse["organisations"];
      return organisationsData
          .map((organisationJson) => Organisation.fromJson(organisationJson))
          .toList();
    } else {
      var jsonResponse = convert.jsonDecode(response.body);
      throw new WiaHttpException(response.statusCode, jsonResponse["message"]);
    }
  }

  Future<List<DeviceWidget>> listDeviceWidgets(String deviceId) async {
    var queryString = "device.id=" + deviceId.toString();

    var response = await http.get(_baseUri + "/widgets?" + queryString,
        headers: getClientHeaders());

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
      print(jsonResponse);
      List<dynamic> widgetsData = jsonResponse["widgets"];
      return widgetsData
          .map((widgetJson) => DeviceWidget.fromJson(widgetJson))
          .toList();
    } else {
      var jsonResponse = convert.jsonDecode(response.body);
      throw new WiaHttpException(response.statusCode, jsonResponse["message"]);
    }
  }

  Future<List<Event>> listEvents(
      {String deviceId = null, String name = null}) async {
    var queryString = "?deviceId=" + deviceId;

    if (name != null) {
      queryString += "&name=" + name;
    }

    var response = await http.get(_baseUri + "/events" + queryString,
        headers: getClientHeaders());

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
      print(jsonResponse);
      List<dynamic> eventsData = jsonResponse["events"];
      return eventsData.map((eventJson) => Event.fromJson(eventJson)).toList();
    } else {
      var jsonResponse = convert.jsonDecode(response.body);
      throw new WiaHttpException(response.statusCode, jsonResponse["message"]);
    }
  }
}
