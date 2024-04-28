// To parse this JSON data, do
//
//     final phoneNumberModel = phoneNumberModelFromJson(jsonString);

import 'dart:convert';

PhoneNumberModel phoneNumberModelFromJson(String str) =>
    PhoneNumberModel.fromJson(json.decode(str));

String phoneNumberModelToJson(PhoneNumberModel data) =>
    json.encode(data.toJson());

class PhoneNumberModel {
  PhoneNumberModel({
    this.statusCode,
    this.message,
    this.data,
  });

  int? statusCode;
  String? message;
  int? data;

  factory PhoneNumberModel.fromJson(Map<String, dynamic> json) =>
      PhoneNumberModel(
        statusCode: json["statusCode"] ?? null,
        message: json["message"] ?? null,
        data: json["data"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "status": statusCode ?? null,
        "message": message ?? null,
        "data": data ?? null,
      };
}
