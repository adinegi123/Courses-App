// To parse this JSON data, do
//
//     final socialLoginModel = socialLoginModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SocialLoginModel socialLoginModelFromJson(String str) =>
    SocialLoginModel.fromJson(json.decode(str));

String socialLoginModelToJson(SocialLoginModel data) =>
    json.encode(data.toJson());

class SocialLoginModel {
  SocialLoginModel({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  int statusCode;
  String message;
  SocialLoginData? data;

  factory SocialLoginModel.fromJson(Map<String, dynamic> json) =>
      SocialLoginModel(
        statusCode: json["statusCode"] ?? null,
        message: json["message"] ?? null,
        data: json["data"] == null
            ? null
            : SocialLoginData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "data": data == null ? null : data!.toJson(),
      };
}

class SocialLoginData {
  SocialLoginData({
    this.id,
    this.fullName,
    this.roleName,
    this.organId,
    this.mobile,
    this.email,
    this.deviceToken,
    this.deviceType,
    this.profileImage,
    this.bio,
    this.verified,
    this.financialApproval,
    this.avatar,
    this.avatarSettings,
    this.coverImg,
    this.headline,
    this.about,
    this.address,
    this.countryId,
    this.provinceId,
    this.cityId,
    this.districtId,
    this.location,
    this.levelOfTraining,
    this.meetingType,
    this.status,
    this.accessContent,
    this.language,
    this.timezone,
    this.newsletter,
    this.publicMessage,
    this.accountType,
    this.iban,
    this.accountId,
    this.identityScan,
    this.certificate,
    this.commission,
    this.affiliate,
    this.canCreateStore,
    this.ban,
    this.banStartAt,
    this.banEndAt,
    this.offline,
    this.offlineMessage,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.token,
  });

  int? id;
  String? fullName;
  String? roleName;
  dynamic organId;
  String? mobile;
  String? email;
  String? deviceToken;
  int? deviceType;
  String? profileImage;
  dynamic bio;
  int? verified;
  int? financialApproval;
  dynamic avatar;
  dynamic avatarSettings;
  dynamic coverImg;
  dynamic headline;
  String? about;
  dynamic address;
  dynamic countryId;
  dynamic provinceId;
  dynamic cityId;
  dynamic districtId;
  dynamic location;
  dynamic levelOfTraining;
  String? meetingType;
  String? status;
  int? accessContent;
  dynamic language;
  dynamic timezone;
  int? newsletter;
  int? publicMessage;
  dynamic accountType;
  dynamic iban;
  dynamic accountId;
  dynamic identityScan;
  dynamic certificate;
  dynamic commission;
  int? affiliate;
  int? canCreateStore;
  int? ban;
  dynamic banStartAt;
  dynamic banEndAt;
  int? offline;
  String? offlineMessage;
  int? createdAt;
  dynamic updatedAt;
  dynamic deletedAt;
  String? token;

  factory SocialLoginData.fromJson(Map<String, dynamic> json) =>
      SocialLoginData(
        id: json["id"] ?? null,
        fullName: json["full_name"] ?? null,
        roleName: json["role_name"] ?? null,
        organId: json["organ_id"],
        mobile: json["mobile"] ?? null,
        email: json["email"] ?? null,
        deviceToken: json["device_token"] ?? null,
        deviceType: json["device_type"] ?? null,
        profileImage: json["profile_image"] ?? null,
        bio: json["bio"],
        verified: json["verified"] ?? null,
        financialApproval: json["financial_approval"] ?? null,
        avatar: json["avatar"],
        avatarSettings: json["avatar_settings"],
        coverImg: json["cover_img"],
        headline: json["headline"],
        about: json["about"] ?? null,
        address: json["address"],
        countryId: json["country_id"],
        provinceId: json["province_id"],
        cityId: json["city_id"],
        districtId: json["district_id"],
        location: json["location"],
        levelOfTraining: json["level_of_training"],
        meetingType: json["meeting_type"] ?? null,
        status: json["status"] ?? null,
        accessContent: json["access_content"] ?? null,
        language: json["language"],
        timezone: json["timezone"],
        newsletter: json["newsletter"] ?? null,
        publicMessage: json["public_message"] ?? null,
        accountType: json["account_type"],
        iban: json["iban"],
        accountId: json["account_id"],
        identityScan: json["identity_scan"],
        certificate: json["certificate"],
        commission: json["commission"],
        affiliate: json["affiliate"] ?? null,
        canCreateStore: json["can_create_store"] ?? null,
        ban: json["ban"] ?? null,
        banStartAt: json["ban_start_at"],
        banEndAt: json["ban_end_at"],
        offline: json["offline"] ?? null,
        offlineMessage: json["offline_message"] ?? null,
        createdAt: json["created_at"] ?? null,
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
        token: json["token"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? null,
        "full_name": fullName ?? null,
        "role_name": roleName ?? null,
        "organ_id": organId,
        "mobile": mobile ?? null,
        "email": email ?? null,
        "device_token": deviceToken ?? null,
        "device_type": deviceType ?? null,
        "profile_image": profileImage ?? null,
        "bio": bio,
        "verified": verified ?? null,
        "financial_approval": financialApproval ?? null,
        "avatar": avatar,
        "avatar_settings": avatarSettings,
        "cover_img": coverImg,
        "headline": headline,
        "about": about ?? null,
        "address": address,
        "country_id": countryId,
        "province_id": provinceId,
        "city_id": cityId,
        "district_id": districtId,
        "location": location,
        "level_of_training": levelOfTraining,
        "meeting_type": meetingType ?? null,
        "status": status ?? null,
        "access_content": accessContent ?? null,
        "language": language,
        "timezone": timezone,
        "newsletter": newsletter ?? null,
        "public_message": publicMessage ?? null,
        "account_type": accountType,
        "iban": iban,
        "account_id": accountId,
        "identity_scan": identityScan,
        "certificate": certificate,
        "commission": commission,
        "affiliate": affiliate ?? null,
        "can_create_store": canCreateStore ?? null,
        "ban": ban ?? null,
        "ban_start_at": banStartAt,
        "ban_end_at": banEndAt,
        "offline": offline ?? null,
        "offline_message": offlineMessage ?? null,
        "created_at": createdAt ?? null,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
        "token": token ?? null,
      };
}
