class User {
  String id;
  String fullName;
  String username;
  String emailAddress;

  // default constructor
  User();

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        fullName = json['fullName'],
        username = json['username'],
        emailAddress = json['emailAddress'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'fullName': fullName,
        'username': username,
        'emailAddress': emailAddress
      };
}
