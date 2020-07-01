import './device_type.dart';
import './event.dart';
import './location.dart';
import './product.dart';

class Device {
  String id;

  String name;

  String serialNumber;

  Product product;

  DeviceType deviceType;

  Location location;

  List<Event> events;

  dynamic state;

  DateTime createdAt;

  DateTime updatedAt;

  // default constructor
  Device();

  Device.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        serialNumber = json['serialNumber'],
        product =
            json['product'] != null ? Product.fromJson(json['product']) : null,
        deviceType =
            json['type'] != null ? DeviceType.fromJson(json['type']) : null,
        location = json['location'] != null
            ? Location.fromJson(json['location'])
            : null,
        events = json['events'] != null
            ? json['events']
                .map((eventJson) => Event.fromJson(eventJson))
                .toList()
            : null,
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
        'serialNumber': serialNumber,
        'product': product,
        'type': deviceType,
        'location': location,
        'events': events,
        'state': state,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}
