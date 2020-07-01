import './event.dart';

class Location {
  String id;

  double latitude;

  double longitude;

  // default constructor
  Location();

  Location.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        latitude = json['latitude'] != null ? json['latitude'] : json['lat'],
        longitude = json['longitude'] != null ? json['longitude'] : json['lng'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'latitude': latitude,
        'longitude': longitude,
      };
}
