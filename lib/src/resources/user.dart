class User {
  String id;
  String fullName;
  String username;
  String emailAddress;
  DateTime createdAt;
  DateTime updatedAt;

  // default constructor
  User();

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        fullName = json['fullName'],
        username = json['username'],
        emailAddress = json['emailAddress'],
        createdAt = json['createdAt'] != null
            ? DateTime.fromMillisecondsSinceEpoch(json['createdAt'],
                isUtc: true)
            : null,
        updatedAt = json['updatedAt'] != null
            ? DateTime.fromMillisecondsSinceEpoch(json['updatedAt'],
                isUtc: true)
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'fullName': fullName,
        'username': username,
        'emailAddress': emailAddress,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}
