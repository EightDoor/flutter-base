import 'package:json_annotation/json_annotation.dart';

part 'upgrade.g.dart';

@JsonSerializable()
class Upgrade extends Object {
  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'data')
  Data data;

  Upgrade(
    this.code,
    this.message,
    this.data,
  );

  static Upgrade fromJson(Map<String, dynamic> srcJson) =>
      _$UpgradeFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UpgradeToJson(this);
}

@JsonSerializable()
class Data extends Object {
  @JsonKey(name: 'buildKey')
  String buildKey;

  @JsonKey(name: 'buildType')
  String buildType;

  @JsonKey(name: 'buildIsFirst')
  String buildIsFirst;

  @JsonKey(name: 'buildIsLastest')
  String buildIsLastest;

  @JsonKey(name: 'buildFileSize')
  String buildFileSize;

  @JsonKey(name: 'buildName')
  String buildName;

  @JsonKey(name: 'buildPassword')
  String buildPassword;

  @JsonKey(name: 'buildVersion')
  String buildVersion;

  @JsonKey(name: 'buildVersionNo')
  String buildVersionNo;

  @JsonKey(name: 'buildQrcodeShowAppIcon')
  String buildQrcodeShowAppIcon;

  @JsonKey(name: 'buildVersionType')
  String buildVersionType;

  @JsonKey(name: 'buildBuildVersion')
  String buildBuildVersion;

  @JsonKey(name: 'buildIdentifier')
  String buildIdentifier;

  @JsonKey(name: 'buildIcon')
  String buildIcon;

  @JsonKey(name: 'buildDescription')
  String buildDescription;

  @JsonKey(name: 'buildUpdateDescription')
  String buildUpdateDescription;

  @JsonKey(name: 'buildScreenshots')
  String buildScreenshots;

  @JsonKey(name: 'buildShortcutUrl')
  String buildShortcutUrl;

  @JsonKey(name: 'buildSignatureType')
  String buildSignatureType;

  @JsonKey(name: 'buildIsAcceptFeedback')
  String buildIsAcceptFeedback;

  @JsonKey(name: 'buildIsUploadCrashlog')
  String buildIsUploadCrashlog;

  @JsonKey(name: 'buildIsOriginalBuildInHouse')
  String buildIsOriginalBuildInHouse;

  @JsonKey(name: 'buildAdhocUuids')
  String buildAdhocUuids;

  @JsonKey(name: 'buildTemplate')
  String buildTemplate;

  @JsonKey(name: 'buildInstallType')
  String buildInstallType;

  @JsonKey(name: 'buildManuallyBlocked')
  String buildManuallyBlocked;

  @JsonKey(name: 'buildIsPlaceholder')
  String buildIsPlaceholder;

  @JsonKey(name: 'buildCates')
  String buildCates;

  @JsonKey(name: 'buildCreated')
  String buildCreated;

  @JsonKey(name: 'buildUpdated')
  String buildUpdated;

  @JsonKey(name: 'buildQRCodeURL')
  String buildQRCodeURL;

  @JsonKey(name: 'isOwner')
  int isOwner;

  @JsonKey(name: 'isJoin')
  int isJoin;

  @JsonKey(name: 'buildFollowed')
  String buildFollowed;

  @JsonKey(name: 'appExpiredDate')
  String appExpiredDate;

  @JsonKey(name: 'isImmediatelyExpired')
  bool isImmediatelyExpired;

  @JsonKey(name: 'appExpiredStatus')
  int appExpiredStatus;

  @JsonKey(name: 'otherApps')
  List<OtherApps> otherApps;

  @JsonKey(name: 'otherAppsCount')
  String otherAppsCount;

  @JsonKey(name: 'todayDownloadCount')
  int todayDownloadCount;

  @JsonKey(name: 'appKey')
  String appKey;

  @JsonKey(name: 'appAutoSync')
  String appAutoSync;

  @JsonKey(name: 'appShowPgyerCopyright')
  String appShowPgyerCopyright;

  @JsonKey(name: 'appDownloadPay')
  String appDownloadPay;

  @JsonKey(name: 'appDownloadDescription')
  String appDownloadDescription;

  @JsonKey(name: 'appGameLicenseStatus')
  String appGameLicenseStatus;

  @JsonKey(name: 'appLang')
  String appLang;

  @JsonKey(name: 'appIsTestFlight')
  String appIsTestFlight;

  @JsonKey(name: 'appIsInstallDate')
  String appIsInstallDate;

  @JsonKey(name: 'appInstallStartDate')
  String appInstallStartDate;

  @JsonKey(name: 'appInstallEndDate')
  String appInstallEndDate;

  @JsonKey(name: 'appInstallQuestion')
  String appInstallQuestion;

  @JsonKey(name: 'appInstallAnswer')
  String appInstallAnswer;

  @JsonKey(name: 'appFeedbackStatus')
  String appFeedbackStatus;

  @JsonKey(name: 'isMerged')
  int isMerged;

  @JsonKey(name: 'canPayDownload')
  int canPayDownload;

  @JsonKey(name: 'iconUrl')
  String iconUrl;

  @JsonKey(name: 'buildScreenshotsUrl')
  List<dynamic> buildScreenshotsUrl;

  Data(
    this.buildKey,
    this.buildType,
    this.buildIsFirst,
    this.buildIsLastest,
    this.buildFileSize,
    this.buildName,
    this.buildPassword,
    this.buildVersion,
    this.buildVersionNo,
    this.buildQrcodeShowAppIcon,
    this.buildVersionType,
    this.buildBuildVersion,
    this.buildIdentifier,
    this.buildIcon,
    this.buildDescription,
    this.buildUpdateDescription,
    this.buildScreenshots,
    this.buildShortcutUrl,
    this.buildSignatureType,
    this.buildIsAcceptFeedback,
    this.buildIsUploadCrashlog,
    this.buildIsOriginalBuildInHouse,
    this.buildAdhocUuids,
    this.buildTemplate,
    this.buildInstallType,
    this.buildManuallyBlocked,
    this.buildIsPlaceholder,
    this.buildCates,
    this.buildCreated,
    this.buildUpdated,
    this.buildQRCodeURL,
    this.isOwner,
    this.isJoin,
    this.buildFollowed,
    this.appExpiredDate,
    this.isImmediatelyExpired,
    this.appExpiredStatus,
    this.otherApps,
    this.otherAppsCount,
    this.todayDownloadCount,
    this.appKey,
    this.appAutoSync,
    this.appShowPgyerCopyright,
    this.appDownloadPay,
    this.appDownloadDescription,
    this.appGameLicenseStatus,
    this.appLang,
    this.appIsTestFlight,
    this.appIsInstallDate,
    this.appInstallStartDate,
    this.appInstallEndDate,
    this.appInstallQuestion,
    this.appInstallAnswer,
    this.appFeedbackStatus,
    this.isMerged,
    this.canPayDownload,
    this.iconUrl,
    this.buildScreenshotsUrl,
  );

  static Data fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class OtherApps extends Object {
  @JsonKey(name: 'buildKey')
  String buildKey;

  @JsonKey(name: 'buildName')
  String buildName;

  @JsonKey(name: 'buildVersion')
  String buildVersion;

  @JsonKey(name: 'buildBuildVersion')
  String buildBuildVersion;

  @JsonKey(name: 'buildIdentifier')
  String buildIdentifier;

  @JsonKey(name: 'buildCreated')
  String buildCreated;

  @JsonKey(name: 'buildUpdateDescription')
  String buildUpdateDescription;

  OtherApps(
    this.buildKey,
    this.buildName,
    this.buildVersion,
    this.buildBuildVersion,
    this.buildIdentifier,
    this.buildCreated,
    this.buildUpdateDescription,
  );

  static OtherApps fromJson(Map<String, dynamic> srcJson) =>
      _$OtherAppsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$OtherAppsToJson(this);
}
