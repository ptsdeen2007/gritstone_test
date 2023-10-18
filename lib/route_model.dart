// To parse this JSON data, do
//
//     final routeModel = routeModelFromJson(jsonString);

import 'dart:convert';

import 'package:google_maps_flutter_platform_interface/src/types/location.dart';

RouteModel routeModelFromJson(String str) => RouteModel.fromJson(json.decode(str));

String routeModelToJson(RouteModel data) => json.encode(data.toJson());

class RouteModel {
  String uniqueId;
  double latitude;
  double longitude;
  int speed;
  double distance;
  bool powerOn;
  bool valid;
  DateTime serverTime;
  DateTime deviceTime;
  int extBatteryVoltage;
  Attributes attributes;

  RouteModel({
    required this.uniqueId,
    required this.latitude,
    required this.longitude,
    required this.speed,
    required this.distance,
    required this.powerOn,
    required this.valid,
    required this.serverTime,
    required this.deviceTime,
    required this.extBatteryVoltage,
    required this.attributes,
  });

  factory RouteModel.fromJson(Map<String, dynamic> json) => RouteModel(
    uniqueId: json["UniqueId"],
    latitude: json["Latitude"]?.toDouble(),
    longitude: json["Longitude"]?.toDouble(),
    speed: json["Speed"],
    distance: json["Distance"],
    powerOn: json["PowerOn"],
    valid: json["Valid"],
    serverTime: DateTime.parse(json["ServerTime"]),
    deviceTime: DateTime.parse(json["DeviceTime"]),
    extBatteryVoltage: json["ExtBatteryVoltage"],
    attributes: Attributes.fromJson(json["Attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "UniqueId": uniqueId,
    "Latitude": latitude,
    "Longitude": longitude,
    "Speed": speed,
    "Distance": distance,
    "PowerOn": powerOn,
    "Valid": valid,
    "ServerTime": serverTime.toIso8601String(),
    "DeviceTime": deviceTime.toIso8601String(),
    "ExtBatteryVoltage": extBatteryVoltage,
    "Attributes": attributes.toJson(),
  };

  LatLng get toLatLng =>LatLng(latitude, longitude);
}

class Attributes {
  Attributes();

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
  );

  Map<String, dynamic> toJson() => {
  };
}
