import 'package:wia_dart_package/wia.dart';

class Kiosk {
  String id;

  String name;

  int slots;

  List<UIWidget> widgets;

  bool gatewayModeEnabled;

  bool useRestApiGateway;

  DateTime createdAt;

  DateTime updatedAt;

  Kiosk();

  Kiosk.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        slots = json['slots'],
        widgets = json['widgets'] != null
            ? json['widgets']
                .map<UIWidget>(
                    (uiWidgetJson) => UIWidget.fromJson(uiWidgetJson))
                .toList()
            : null,
        gatewayModeEnabled = json['gatewayModeEnabled'],
        useRestApiGateway = json['useRestApiGateway'],
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
        'slots': slots,
        'gatewayModeEnabled': gatewayModeEnabled,
        'useRestApiGateway': useRestApiGateway,
        'widgets': widgets,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}
