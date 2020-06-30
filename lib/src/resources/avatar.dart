class Avatar {
  String url;

  String thumbnail;

  // default constructor
  Avatar();

  Avatar.fromJson(Map<String, dynamic> json)
      : url = json['url'],
        thumbnail = json['thumbnail'];

  Map<String, dynamic> toJson() => {
        'url': url,
        'thumbnail': thumbnail,
      };
}
