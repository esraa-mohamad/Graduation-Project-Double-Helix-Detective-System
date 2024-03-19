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
  @JsonKey(name: "token")
  String ? token ;
  @JsonKey(name: "technical")
  TechnicalResponse ? technicalResponse ;

  AuthenticationResponse({required this.technicalResponse , required this.token});

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
  Map<String,dynamic> toJson() =>
      _$AddPopulationResponseToJson(this);
}
