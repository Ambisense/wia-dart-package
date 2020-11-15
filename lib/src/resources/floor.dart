class Floor {
  String id;

  String name;

  dynamic config;

  dynamic state;

  DateTime createdAt;

  DateTime updatedAt;

  Floor();

  Floor.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        config = json['config'],
        state = json['state'],
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
        'name': name,
        'config': config,
        'state': state,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}
