class Kiosk {
  String id;

  String name;

  Kiosk();

  Kiosk.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
