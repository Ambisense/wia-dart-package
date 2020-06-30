import './organisation.dart';
import './user.dart';

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
