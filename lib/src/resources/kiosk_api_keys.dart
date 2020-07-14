class KioskApiKeys {
  String secretKey;

  DateTime createdAt;

  KioskApiKeys();

  KioskApiKeys.fromJson(Map<String, dynamic> json)
      : secretKey = json['secretKey'],
        createdAt = json['createdAt'] != null
            ? DateTime.fromMillisecondsSinceEpoch(json['createdAt'],
                isUtc: true)
            : null;

  Map<String, dynamic> toJson() => {
        'secretKey': secretKey,
        'createdAt': createdAt,
      };
}
