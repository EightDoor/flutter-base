// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upgrade.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Upgrade _$UpgradeFromJson(Map<String, dynamic> json) {
  return Upgrade(
    json['code'] as int,
    json['message'] as String,
    Data.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpgradeToJson(Upgrade instance) => <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    json['buildKey'] as String,
    json['buildType'] as String,
    json['buildIsFirst'] as String,
    json['buildIsLastest'] as String,
    json['buildFileSize'] as String,
    json['buildName'] as String,
    json['buildPassword'] as String,
    json['buildVersion'] as String,
    json['buildVersionNo'] as String,
    json['buildQrcodeShowAppIcon'] as String,
    json['buildVersionType'] as String,
    json['buildBuildVersion'] as String,
    json['buildIdentifier'] as String,
    json['buildIcon'] as String,
    json['buildDescription'] as String,
    json['buildUpdateDescription'] as String,
    json['buildScreenshots'] as String,
    json['buildShortcutUrl'] as String,
    json['buildSignatureType'] as String,
    json['buildIsAcceptFeedback'] as String,
    json['buildIsUploadCrashlog'] as String,
    json['buildIsOriginalBuildInHouse'] as String,
    json['buildAdhocUuids'] as String,
    json['buildTemplate'] as String,
    json['buildInstallType'] as String,
    json['buildManuallyBlocked'] as String,
    json['buildIsPlaceholder'] as String,
    json['buildCates'] as String,
    json['buildCreated'] as String,
    json['buildUpdated'] as String,
    json['buildQRCodeURL'] as String,
    json['isOwner'] as int,
    json['isJoin'] as int,
    json['buildFollowed'] as String,
    json['appExpiredDate'] as String,
    json['isImmediatelyExpired'] as bool,
    json['appExpiredStatus'] as int,
    (json['otherApps'] as List<dynamic>)
        .map((e) => OtherApps.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['otherAppsCount'] as String,
    json['todayDownloadCount'] as int,
    json['appKey'] as String,
    json['appAutoSync'] as String,
    json['appShowPgyerCopyright'] as String,
    json['appDownloadPay'] as String,
    json['appDownloadDescription'] as String,
    json['appGameLicenseStatus'] as String,
    json['appLang'] as String,
    json['appIsTestFlight'] as String,
    json['appIsInstallDate'] as String,
    json['appInstallStartDate'] as String,
    json['appInstallEndDate'] as String,
    json['appInstallQuestion'] as String,
    json['appInstallAnswer'] as String,
    json['appFeedbackStatus'] as String,
    json['isMerged'] as int,
    json['canPayDownload'] as int,
    json['iconUrl'] as String,
    json['buildScreenshotsUrl'] as List<dynamic>,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'buildKey': instance.buildKey,
      'buildType': instance.buildType,
      'buildIsFirst': instance.buildIsFirst,
      'buildIsLastest': instance.buildIsLastest,
      'buildFileSize': instance.buildFileSize,
      'buildName': instance.buildName,
      'buildPassword': instance.buildPassword,
      'buildVersion': instance.buildVersion,
      'buildVersionNo': instance.buildVersionNo,
      'buildQrcodeShowAppIcon': instance.buildQrcodeShowAppIcon,
      'buildVersionType': instance.buildVersionType,
      'buildBuildVersion': instance.buildBuildVersion,
      'buildIdentifier': instance.buildIdentifier,
      'buildIcon': instance.buildIcon,
      'buildDescription': instance.buildDescription,
      'buildUpdateDescription': instance.buildUpdateDescription,
      'buildScreenshots': instance.buildScreenshots,
      'buildShortcutUrl': instance.buildShortcutUrl,
      'buildSignatureType': instance.buildSignatureType,
      'buildIsAcceptFeedback': instance.buildIsAcceptFeedback,
      'buildIsUploadCrashlog': instance.buildIsUploadCrashlog,
      'buildIsOriginalBuildInHouse': instance.buildIsOriginalBuildInHouse,
      'buildAdhocUuids': instance.buildAdhocUuids,
      'buildTemplate': instance.buildTemplate,
      'buildInstallType': instance.buildInstallType,
      'buildManuallyBlocked': instance.buildManuallyBlocked,
      'buildIsPlaceholder': instance.buildIsPlaceholder,
      'buildCates': instance.buildCates,
      'buildCreated': instance.buildCreated,
      'buildUpdated': instance.buildUpdated,
      'buildQRCodeURL': instance.buildQRCodeURL,
      'isOwner': instance.isOwner,
      'isJoin': instance.isJoin,
      'buildFollowed': instance.buildFollowed,
      'appExpiredDate': instance.appExpiredDate,
      'isImmediatelyExpired': instance.isImmediatelyExpired,
      'appExpiredStatus': instance.appExpiredStatus,
      'otherApps': instance.otherApps,
      'otherAppsCount': instance.otherAppsCount,
      'todayDownloadCount': instance.todayDownloadCount,
      'appKey': instance.appKey,
      'appAutoSync': instance.appAutoSync,
      'appShowPgyerCopyright': instance.appShowPgyerCopyright,
      'appDownloadPay': instance.appDownloadPay,
      'appDownloadDescription': instance.appDownloadDescription,
      'appGameLicenseStatus': instance.appGameLicenseStatus,
      'appLang': instance.appLang,
      'appIsTestFlight': instance.appIsTestFlight,
      'appIsInstallDate': instance.appIsInstallDate,
      'appInstallStartDate': instance.appInstallStartDate,
      'appInstallEndDate': instance.appInstallEndDate,
      'appInstallQuestion': instance.appInstallQuestion,
      'appInstallAnswer': instance.appInstallAnswer,
      'appFeedbackStatus': instance.appFeedbackStatus,
      'isMerged': instance.isMerged,
      'canPayDownload': instance.canPayDownload,
      'iconUrl': instance.iconUrl,
      'buildScreenshotsUrl': instance.buildScreenshotsUrl,
    };

OtherApps _$OtherAppsFromJson(Map<String, dynamic> json) {
  return OtherApps(
    json['buildKey'] as String,
    json['buildName'] as String,
    json['buildVersion'] as String,
    json['buildBuildVersion'] as String,
    json['buildIdentifier'] as String,
    json['buildCreated'] as String,
    json['buildUpdateDescription'] as String,
  );
}

Map<String, dynamic> _$OtherAppsToJson(OtherApps instance) => <String, dynamic>{
      'buildKey': instance.buildKey,
      'buildName': instance.buildName,
      'buildVersion': instance.buildVersion,
      'buildBuildVersion': instance.buildBuildVersion,
      'buildIdentifier': instance.buildIdentifier,
      'buildCreated': instance.buildCreated,
      'buildUpdateDescription': instance.buildUpdateDescription,
    };
