import './avatar.dart';
import './location.dart';
import './organisation.dart';
import './user.dart';

class Space {
  String id;

  String name;

  SpaceOwner owner;

  Avatar avatar;

  Location location;

  SpaceConfig config;

  DateTime createdAt;

  DateTime updatedAt;

  // default constructor
  Space();

  Space.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        owner = SpaceOwner.fromJson(json['owner']),
        avatar = Avatar.fromJson(json['avatar']),
        config = json['config'] != null
            ? SpaceConfig.fromJson(json['config'])
            : null,
        location = json['config'] != null
            ? SpaceConfig.fromJson(json['config']).location
            : null,
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
        'owner': owner,
        'avatar': avatar,
        'config': config,
        'location': location,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}

class SpaceConfig {
  Location location;

  // default constructor
  SpaceConfig();

  SpaceConfig.fromJson(Map<String, dynamic> json)
      : location = (json['location'] != null
            ? Location.fromJson(json['location'])
            : null);

  Map<String, dynamic> toJson() => {'location': location};
}

class SpaceOwner {
  Organisation organisation;
  User user;

  // default constructor
  SpaceOwner();

  SpaceOwner.fromJson(Map<String, dynamic> json)
      : organisation = (json['organisation'] != null
            ? Organisation.fromJson(json['organisation'])
            : null),
        user = (json['user'] != null ? User.fromJson(json['user']) : null);

  Map<String, dynamic> toJson() => {'organisation': organisation, 'user': user};
}
