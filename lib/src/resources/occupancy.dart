class Occupancy {
  int count;

  int capacity;

  DateTime timestamp;

  Occupancy();

  Occupancy.fromJson(Map<String, dynamic> json)
      : count = json['count'],
        capacity = json['capacity'],
        timestamp = json['timestamp'] != null
            ? DateTime.fromMillisecondsSinceEpoch(json['timestamp'],
                isUtc: true)
            : null;

  Map<String, dynamic> toJson() => {
        'count': count,
        'capacity': capacity,
        'timestamp': timestamp,
      };
}
