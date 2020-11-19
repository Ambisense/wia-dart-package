import 'package:wia_dart_package/src/resources/device.dart';
import 'package:wia_dart_package/src/resources/floor.dart';

class Workplace {
  String id;

  String name;

  String type;

  Floor floor;

  WorkplaceMeta meta;

  WorkplaceConfig config;

  dynamic state;

  WorkplaceOccupancy occupancy;

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
        floor = json['floor'] != null ? Floor.fromJson(json['floor']) : null,
        config = json['config'] != null
            ? WorkplaceConfig.fromJson(json['config'])
            : null,
        state = json['state'],
        occupancy = json['occupancy'] != null
            ? WorkplaceOccupancy.fromJson(json['occupancy'])
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
        'floor': floor,
        'config': config,
        'state': state,
        'occupancy': occupancy,
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
  int capacity;

  WorkplaceConfig(this.capacity);

  WorkplaceConfig.fromJson(Map<String, dynamic> json)
      : capacity = json['capacity'];

  Map<String, dynamic> toJson() => {
        "capacity": capacity,
      };
}

class WorkplaceOccupancy {
  int current;
  int flowIn;
  int flowOut;

  WorkplaceOccupancy();

  WorkplaceOccupancy.fromJson(Map<String, dynamic> json)
      : current = json['current'],
        flowIn = json['in'],
        flowOut = json['out'];

  Map<String, dynamic> toJson() =>
      {"current": current, "in": flowIn, "out": flowOut};
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
