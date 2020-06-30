class Organisation {
  String id;
  String name;

  // default constructor
  Organisation();

  Organisation.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}
