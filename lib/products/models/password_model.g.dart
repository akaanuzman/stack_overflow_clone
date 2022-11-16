// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PasswordModel _$PasswordModelFromJson(Map<String, dynamic> json) =>
    PasswordModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      token: json['token'] as int?,
      userTokenDTO: json['userTokenDTO'] as String? ?? "",
    );

Map<String, dynamic> _$PasswordModelToJson(PasswordModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'token': instance.token,
      'userTokenDTO': instance.userTokenDTO,
    };
