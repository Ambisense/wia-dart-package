import 'event.dart';

class DeviceWidget {
  String id;

  String name;

  DeviceWidgetType type;

  DeviceWidgetConfig config;

  DateTime createdAt;

  DateTime updatedAt;

  // default constructor
  DeviceWidget();

  DeviceWidget.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        type = json['type'] != null ? DeviceWidgetType.fromJson(json['type']) : null,
        config = json['config'] != null ? DeviceWidgetConfig.fromJson(json['config']) : null,
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
        'type': type,
        'config': config,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}

class DeviceWidgetType {
  int id;

  String name;

  // default constructor
  DeviceWidgetType();

  DeviceWidgetType.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}

class DeviceWidgetConfig {
  // All
  String dataType;

  int order;

  // Events
  String eventName;

  // State
  String stateKey;

  // Text
  String eventUnit;

  String color;

  // Image
  String staticImage;

  // Line chart
  String timePeriod;

  String aggregateFunction;

  List<String> lineChartEvents;

  // default constructor
  DeviceWidgetConfig();

  DeviceWidgetConfig.fromJson(Map<String, dynamic> json)
      : dataType = json['dataType'],
        order = json['order'],
        eventName = json['eventName'],
        stateKey = json['stateKey'],
        eventUnit = json['eventUnit'],
        color = json['color'],
        staticImage = json['staticImage'],
        timePeriod = json['timePeriod'],
        aggregateFunction = json['aggregateFunction'],
        lineChartEvents = json['lineChartEvents'] != null
            ? json['lineChartEvents']
                .map<String>((event) => event as String)
                .toList()
            : null;

  Map<String, dynamic> toJson() => {
        'dataType': dataType,
        'order': order,
        'eventName': eventName,
        'stateKey': stateKey,
        'eventUnit': eventUnit,
        'color': color,
        'staticImage': staticImage,
        'timePeriod': timePeriod,
        'aggregateFunction': aggregateFunction,
        'lineChartEvents': lineChartEvents,
      };
}
