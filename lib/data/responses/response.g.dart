// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse()
  ..status = json['statusCode'] as int?
  ..message = json['message'] as String?;

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.status,
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
      token: json['newToken'] as String?,
      expiresIn: json['expiresIn'] as String?,
    )
      ..status = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$AuthenticationResponseToJson(
        AuthenticationResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.status,
      'message': instance.message,
      'newToken': instance.token,
      'expiresIn': instance.expiresIn,
      'technical': instance.technicalResponse,
    };

PopulationResponse _$PopulationResponseFromJson(Map<String, dynamic> json) =>
    PopulationResponse(
      name: json['name'] as String?,
      address: json['address'] as String?,
      nationalId: json['national_id'] as String?,
      statusPerson: json['status'] as String?,
    );

Map<String, dynamic> _$PopulationResponseToJson(PopulationResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'national_id': instance.nationalId,
      'status': instance.statusPerson,
    };

AddPopulationResponse _$AddPopulationResponseFromJson(
        Map<String, dynamic> json) =>
    AddPopulationResponse(
      json['person'] == null
          ? null
          : PopulationResponse.fromJson(json['person'] as Map<String, dynamic>),
    )
      ..status = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$AddPopulationResponseToJson(
        AddPopulationResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.status,
      'message': instance.message,
      'person': instance.populationResponse,
    };

LogoutResponse _$LogoutResponseFromJson(Map<String, dynamic> json) =>
    LogoutResponse()
      ..status = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$LogoutResponseToJson(LogoutResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.status,
      'message': instance.message,
    };

CompareDnaResponse _$CompareDnaResponseFromJson(Map<String, dynamic> json) =>
    CompareDnaResponse(
      json['match_status'] as String?,
      json['similarity_percentage'] as int?,
    )
      ..status = json['statusCode'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$CompareDnaResponseToJson(CompareDnaResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.status,
      'message': instance.message,
      'match_status': instance.match,
      'similarity_percentage': instance.similarity,
    };
