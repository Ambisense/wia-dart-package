class DeviceType {
  int id;

  String manufacturer;

  String model;

  String slug;

  String modelSlug;

  DeviceType();

  DeviceType.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        manufacturer = json['manufacturer'],
        model = json['model'],
        slug = json['slug'],
        modelSlug = json['modelSlug'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'manufacturer': manufacturer,
        'model': model,
        'slug': slug,
        'modelSlug': modelSlug,
      };
}
