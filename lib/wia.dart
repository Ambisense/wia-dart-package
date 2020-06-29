import 'dart:async';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

// import local files
import './src/resources/access_token.dart';
import './src/resources/user.dart';

// export classes to the public
export './src/resources/access_token.dart';
export './src/resources/user.dart';

class Wia {
  final _baseUri = "https://api.wia.io/v1";
  String _appKey;
  String _accessToken;

  Wia(String appKey, {String accessToken}) {
    _appKey = appKey;
    _accessToken = accessToken;
  }

  // URL to fetch users from
  // This is a private variable to the library.
  String _fetchUsersURL = 'https://reqres.in/api/users';

  // /**
  //  * This function returns an iterator of User objects.
  //  */
  // Future<Iterable<User>> getUsers() async {
  //   var users = await fetchUserList(_fetchUsersURL);

  //   // return Iterable object
  //   return users.map((user) {
  //     return User(user['id'], user['first_name'], user['last_name'], "");
  //   });
  // }

  Future<AccessToken> login(String username, String password) async {
    var response = await http.post(_baseUri + "/auth/token", body: {
      'username': username,
      'password': password,
      'scope': 'user',
      'grantType': 'password'
    }, headers: {
      'x-client-key': 'ck_HDUVdx2YZ2EqDNgD9vXR'
    });

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var accessToken = AccessToken.fromJson(jsonResponse);
      return accessToken;
    } else {
      throw ("Error with logging in. Status code: " +
          response.statusCode.toString());
    }
  }
}
