class Notification {
  String id;

  String title;

  String body;

  dynamic data;

  DateTime createdAt;

  DateTime updatedAt;

  // default constructor
  Notification();

  Notification.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        body = json['body'],
        data = json['data'],
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
        'title': title,
        'body': body,
        'data': data,
        'createdAt': createdAt,
        'updatedAt': updatedAt
      };
}
