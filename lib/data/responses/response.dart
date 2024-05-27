
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
part 'response.g.dart';


@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "statusCode")
  int ? status ;
  @JsonKey(name: "message")
  String ? message ;
}

@JsonSerializable()
class TechnicalResponse {
  @JsonKey(name: "username")
  String ? userName ;
  @JsonKey(name: "phone")
  String ? phone ;

  TechnicalResponse({required this.userName , required this.phone});

  factory TechnicalResponse.fromJson(Map<String,dynamic> json) => _$TechnicalResponseFromJson(json);

  // to json
  Map<String,dynamic> toJson() =>
      _$TechnicalResponseToJson(this);
}

@JsonSerializable()
class AuthenticationResponse extends BaseResponse{
  @JsonKey(name: "newToken")
  String ? token ;
  @JsonKey(name: "expiresIn")
  String ? expiresIn ;
  @JsonKey(name: "technical")
  TechnicalResponse ? technicalResponse ;

  AuthenticationResponse({required this.technicalResponse , required this.token , required this.expiresIn });

  factory AuthenticationResponse.fromJson(Map<String,dynamic> json) =>_$AuthenticationResponseFromJson(json);

  // to json
  Map<String,dynamic> toJson() =>
      _$AuthenticationResponseToJson(this);

}

@JsonSerializable()
class PopulationResponse {
  @JsonKey(name: "name")
  String ? name ;
  @JsonKey(name: "address")
  String ? address ;
  @JsonKey(name: "national_id")
  String ? nationalId ;
  @JsonKey(name: "status")
  String ? statusPerson ;

  PopulationResponse({
    required this.name ,
    required this.address,
    required this.nationalId ,
    required this.statusPerson,
});

  factory PopulationResponse.fromJson(Map<String,dynamic> json) =>_$PopulationResponseFromJson(json);

  // to json
  Map<String,dynamic> toJson() =>
      _$PopulationResponseToJson(this);
}

@JsonSerializable()
class AddPopulationResponse extends BaseResponse{
  @JsonKey(name: "person")
  PopulationResponse ? populationResponse;

  AddPopulationResponse(this.populationResponse);

  factory AddPopulationResponse.fromJson(Map<String,dynamic> json) =>_$AddPopulationResponseFromJson(json);

  // to json
  // Map<String,dynamic> toJson() =>
  //     _$AddPopulationResponseToJson(this);
}

@JsonSerializable()
class LogoutResponse extends BaseResponse{

  LogoutResponse();
  factory LogoutResponse.fromJson(Map<String,dynamic> json) =>_$LogoutResponseFromJson(json);

  // to json
  Map<String,dynamic> toJson() =>
      _$LogoutResponseToJson(this);
}


@JsonSerializable()
class CompareDnaResponse extends BaseResponse{
  @JsonKey(name:"match_status")
  String ? match;
  @JsonKey(name:"similarity_percentage")
  int ? similarity;
  CompareDnaResponse(this.match,this.similarity);
  factory CompareDnaResponse.fromJson(Map<String,dynamic> json) =>_$CompareDnaResponseFromJson(json);

  // to json
  Map<String,dynamic> toJson() =>
      _$CompareDnaResponseToJson(this);

}

@JsonSerializable()
class PersonInfoResponse {
  @JsonKey(name:"name")
  String ? name ;
  @JsonKey(name:"address")
  String ? address ;
  @JsonKey(name:"phone")
  String ? phone ;
  @JsonKey(name:"national_id")
  String ? nationalId ;
  @JsonKey(name:"gender")
  String ? gender ;
  @JsonKey(name:"bloodType")
  String ? bloodType ;
  @JsonKey(name:"birthdate")
  String ? birthDate ;
  @JsonKey(name:"status")
  String ? status ;
  @JsonKey(name:"description")
  String ? description ;

  PersonInfoResponse({
    required this.name,
    required this.address ,
    required this.phone,
    required this.nationalId,
    required this.gender,
    required this.bloodType ,
    required this.birthDate ,
    required this.status ,
    required this.description
});

  factory PersonInfoResponse.fromJson(Map<String,dynamic> json) =>_$PersonInfoResponseFromJson(json);

  // to json
  Map<String,dynamic> toJson() =>
      _$PersonInfoResponseToJson(this);
}

@JsonSerializable()
class SearchMatchingInfoResponse  extends BaseResponse{
  @JsonKey(name :"matches")
  PersonInfoResponse ? personInfoResponse;
  @JsonKey(name: "match_status")
  String ? matchStatus;
  @JsonKey(name:"similarity_percentage")
  int ? similarity;

  SearchMatchingInfoResponse({required this.personInfoResponse , required this.matchStatus , required this.similarity});

  factory SearchMatchingInfoResponse.fromJson(Map<String,dynamic> json) =>_$SearchMatchingInfoResponseFromJson(json);

  // to json
  Map<String,dynamic> toJson() =>
      _$SearchMatchingInfoResponseToJson(this);
}

@JsonSerializable()
class AllMissingSearchResultResponse extends BaseResponse{
  @JsonKey(name:'main_match_info')
  MissingPersonInfoResponse ? missingPersonInfoResponse;
  @JsonKey(name:"potential_relative_info")
  List<MissingRelativeInfoResponse> ? missingRelativeInfoResponse;
  AllMissingSearchResultResponse({required this.missingPersonInfoResponse,required this.missingRelativeInfoResponse});
  factory AllMissingSearchResultResponse.fromJson(Map<String,dynamic> json) =>_$AllMissingSearchResultResponseFromJson(json);

  // to json
  Map<String,dynamic> toJson() =>
      _$AllMissingSearchResultResponseToJson(this);
}
@JsonSerializable()
class MissingPersonInfoResponse {
  @JsonKey(name:"name")
  String ? name ;
  @JsonKey(name:"address")
  String ? address ;
  @JsonKey(name:"phone")
  String ? phone ;
  @JsonKey(name:"national_id")
  String ? nationalId ;
  @JsonKey(name:"gender")
  String ? gender ;
  @JsonKey(name:"bloodType")
  String ? bloodType ;
  @JsonKey(name:"birthdate")
  String ? birthDate ;
  @JsonKey(name:"status")
  String ? status ;
  @JsonKey(name:"description")
  String ? description ;
  @JsonKey(name: 'match_status')
  String ? matchStatus;
  @JsonKey(name: 'similarity_percentage')
  int ? similarity;

  MissingPersonInfoResponse({
    required this.name,
    required this.address ,
    required this.phone,
    required this.nationalId,
    required this.gender,
    required this.bloodType ,
    required this.birthDate ,
    required this.status ,
    required this.description,
    required this.matchStatus,
    required this.similarity
  });

  factory MissingPersonInfoResponse.fromJson(Map<String,dynamic> json) =>_$MissingPersonInfoResponseFromJson(json);

  // to json
  Map<String,dynamic> toJson() =>
      _$MissingPersonInfoResponseToJson(this);
}
@JsonSerializable()
class MissingRelativeInfoResponse{
  @JsonKey(name:'relative_data')
  PersonInfoResponse ? missingRelativeInfo;

  MissingRelativeInfoResponse({required this.missingRelativeInfo});
  factory MissingRelativeInfoResponse.fromJson(Map<String,dynamic> json) =>_$MissingRelativeInfoResponseFromJson(json);

  // to json
  Map<String,dynamic> toJson() =>
      _$MissingRelativeInfoResponseToJson(this);
}

@JsonSerializable()
class PaternityTestResponse extends BaseResponse{
  @JsonKey(name:"match_status")
  String ? match;
  @JsonKey(name:"similarity_percentage")
  int ? similarity;
  PaternityTestResponse(this.match,this.similarity);
  factory PaternityTestResponse.fromJson(Map<String,dynamic> json) =>_$PaternityTestResponseFromJson(json);

  // to json
  Map<String,dynamic> toJson() =>
      _$PaternityTestResponseToJson(this);

}
