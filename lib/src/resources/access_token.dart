class AccessToken {
  String token;

  // default constructor
  AccessToken();

  AccessToken.fromJson(Map<String, dynamic> json) : token = json['token']; //,
  // email = json['email'];

  Map<String, dynamic> toJson() => {
        'token': token,
      };
}
