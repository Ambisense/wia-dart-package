class Event {
  String id;

  String name;

  dynamic data;

  DateTime timestamp;

  String timestampRaw;

  // default constructor
  Event();

  Event.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        data = json['data'],
        timestamp = json['timestamp'],
        timestampRaw = json['timestampRaw'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'data': data,
        'timestamp': timestamp,
        'timestampRaw': timestampRaw,
      };
}
