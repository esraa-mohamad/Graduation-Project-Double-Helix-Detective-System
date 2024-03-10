// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse()
  ..status = json['Status'] as int?
  ..message = json['message'] as String?;

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'Status': instance.status,
      'message': instance.message,
    };

TechnicalResponse _$TechnicalResponseFromJson(Map<String, dynamic> json) =>
    TechnicalResponse(
      userName: json['username'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$TechnicalResponseToJson(TechnicalResponse instance) =>
    <String, dynamic>{
      'username': instance.userName,
      'phone': instance.phone,
    };

AuthenticationResponse _$AuthenticationResponseFromJson(
        Map<String, dynamic> json) =>
    AuthenticationResponse(
      technicalResponse: json['technical'] == null
          ? null
          : TechnicalResponse.fromJson(
              json['technical'] as Map<String, dynamic>),
    )
      ..status = json['Status'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$AuthenticationResponseToJson(
        AuthenticationResponse instance) =>
    <String, dynamic>{
      'Status': instance.status,
      'message': instance.message,
      'technical': instance.technicalResponse,
    };
