class ProfileModel {
  final int? statusCode;
  final String? message;
  final Data? data;

  ProfileModel({
    this.statusCode,
    this.message,
    this.data,
  });

  ProfileModel.fromJson(Map<String, dynamic> json)
    : statusCode = json['statusCode'] as int?,
      message = json['message'] as String?,
      data = (json['data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['data'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'statusCode' : statusCode,
    'message' : message,
    'data' : data?.toJson()
  };
}

class Data {
  final int? id;
  final String? fullName;
  final String? roleName;
  final dynamic organId;
  final String? mobile;
  final String? email;
  final dynamic deviceToken;
  final dynamic deviceType;
  final dynamic profileImage;
  final dynamic bio;
  final int? verified;
  final int? financialApproval;
  final dynamic avatar;
  final String? avatarSettings;
  final dynamic coverImg;
  final dynamic headline;
  final String? about;
  final dynamic address;
  final dynamic countryId;
  final dynamic provinceId;
  final dynamic cityId;
  final dynamic districtId;
  final dynamic location;
  final dynamic levelOfTraining;
  final String? meetingType;
  final String? status;
  final int? accessContent;
  final dynamic language;
  final dynamic timezone;
  final int? newsletter;
  final int? publicMessage;
  final dynamic accountType;
  final dynamic iban;
  final dynamic accountId;
  final dynamic identityScan;
  final dynamic certificate;
  final dynamic commission;
  final int? affiliate;
  final int? canCreateStore;
  final int? ban;
  final dynamic banStartAt;
  final dynamic banEndAt;
  final int? offline;
  final String? offlineMessage;
  final int? createdAt;
  final dynamic updatedAt;
  final dynamic deletedAt;
  final String? token;

  Data({
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

  Data.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      fullName = json['full_name'] as String?,
      roleName = json['role_name'] as String?,
      organId = json['organ_id'],
      mobile = json['mobile'] as String?,
      email = json['email'] as String?,
      deviceToken = json['device_token'],
      deviceType = json['device_type'],
      profileImage = json['profile_image'],
      bio = json['bio'],
      verified = json['verified'] as int?,
      financialApproval = json['financial_approval'] as int?,
      avatar = json['avatar'],
      avatarSettings = json['avatar_settings'] as String?,
      coverImg = json['cover_img'],
      headline = json['headline'],
      about = json['about'] as String?,
      address = json['address'],
      countryId = json['country_id'],
      provinceId = json['province_id'],
      cityId = json['city_id'],
      districtId = json['district_id'],
      location = json['location'],
      levelOfTraining = json['level_of_training'],
      meetingType = json['meeting_type'] as String?,
      status = json['status'] as String?,
      accessContent = json['access_content'] as int?,
      language = json['language'],
      timezone = json['timezone'],
      newsletter = json['newsletter'] as int?,
      publicMessage = json['public_message'] as int?,
      accountType = json['account_type'],
      iban = json['iban'],
      accountId = json['account_id'],
      identityScan = json['identity_scan'],
      certificate = json['certificate'],
      commission = json['commission'],
      affiliate = json['affiliate'] as int?,
      canCreateStore = json['can_create_store'] as int?,
      ban = json['ban'] as int?,
      banStartAt = json['ban_start_at'],
      banEndAt = json['ban_end_at'],
      offline = json['offline'] as int?,
      offlineMessage = json['offline_message'] as String?,
      createdAt = json['created_at'] as int?,
      updatedAt = json['updated_at'],
      deletedAt = json['deleted_at'],
      token = json['token'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'full_name' : fullName,
    'role_name' : roleName,
    'organ_id' : organId,
    'mobile' : mobile,
    'email' : email,
    'device_token' : deviceToken,
    'device_type' : deviceType,
    'profile_image' : profileImage,
    'bio' : bio,
    'verified' : verified,
    'financial_approval' : financialApproval,
    'avatar' : avatar,
    'avatar_settings' : avatarSettings,
    'cover_img' : coverImg,
    'headline' : headline,
    'about' : about,
    'address' : address,
    'country_id' : countryId,
    'province_id' : provinceId,
    'city_id' : cityId,
    'district_id' : districtId,
    'location' : location,
    'level_of_training' : levelOfTraining,
    'meeting_type' : meetingType,
    'status' : status,
    'access_content' : accessContent,
    'language' : language,
    'timezone' : timezone,
    'newsletter' : newsletter,
    'public_message' : publicMessage,
    'account_type' : accountType,
    'iban' : iban,
    'account_id' : accountId,
    'identity_scan' : identityScan,
    'certificate' : certificate,
    'commission' : commission,
    'affiliate' : affiliate,
    'can_create_store' : canCreateStore,
    'ban' : ban,
    'ban_start_at' : banStartAt,
    'ban_end_at' : banEndAt,
    'offline' : offline,
    'offline_message' : offlineMessage,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'deleted_at' : deletedAt,
    'token' : token
  };
}