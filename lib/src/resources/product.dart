class Product {
  String id;

  String manufacturer;

  String model;

  String name;

  String colour;

  String image;

  // default constructor
  Product();

  Product.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        manufacturer = json['manufacturer'],
        model = json['model'],
        name = json['name'],
        colour = json['colour'],
        image = json['image'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'manufacturer': manufacturer,
        'model': model,
        'name': name,
        'colour': colour,
        'image': image,
      };
}
