// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      id: json['id'] as String?,
      fullName: json['fullname'] as String?,
      email: json['email'] as String?,
      avatat: json['avatar'] as String?,
      phoneNumber: json['phone'] as String?,
      fcmToken: json['fcm_token'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'id': instance.id,
      'fullname': instance.fullName,
      'email': instance.email,
      'avatar': instance.avatat,
      'phone': instance.phoneNumber,
      'fcm_token': instance.fcmToken,
      'description': instance.description,
    };
