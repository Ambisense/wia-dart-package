import './space_owner.dart';
import './avatar.dart';

class Space {
  String id;

  String name;

  SpaceOwner owner;

  Avatar avatar;

  // default constructor
  Space();

  Space.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        owner = SpaceOwner.fromJson(json['owner']),
        avatar = Avatar.fromJson(json['avatar']);

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'owner': owner, 'avatar': avatar};
}
