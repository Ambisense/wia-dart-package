import 'package:wia_dart_package/src/resources/device.dart';

class Workplace {
  String id;

  String name;

  String type;

  WorkplaceMeta meta;

  WorkplaceConfig config;

  List<Device> devices;

  String parentWorkplace;

  DateTime createdAt;

  DateTime updatedAt;

  Workplace();

  Workplace.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        type = json['type'],
        // meta =
            // json['meta'] != null ? WorkplaceMeta.fromJson(json['meta']) : null,
        config = json['config'] != null
            ? WorkplaceConfig.fromJson(json['config'])
            : null,
        devices = json['devices'] != null
            ? json['devices']
                .map<Device>((deviceJson) => Device.fromJson(deviceJson))
                .toList()
            : null,
        parentWorkplace = json['parentWorkplace'],
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
        'type': type,
        'meta': meta,
        'config': config,
        'devices': devices,
        'parentWorkplace': parentWorkplace,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}

class WorkplaceMeta {
  List<Vector3> points;

  WorkplaceMeta.fromJson(Map<String, dynamic> json)
      : points = json['points'] != null
            ? json['points']
                .map<Vector3>((pointsJson) => Vector3.fromJson(pointsJson))
                .toList()
            : null;

  Map<String, dynamic> toJson() => {
        'points': points,
      };
}

class WorkplaceConfig {
  WorkplaceConfig();

  WorkplaceConfig.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() => {};
}

class Vector3 {
  double x;

  double y;

  double z;

  Vector3(this.x, this.y, this.z);

  Vector3.fromJson(Map<String, dynamic> json)
      : x = json['x'],
        y = json['y'],
        z = json['z'];

  Map<String, dynamic> toJson() => {
        'x': x,
        'y': y,
        'z': z,
      };
}
