// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
part 'response.g.dart';


@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "status")
  int ? status ;
  @JsonKey(name: "message")
  String ? message ;
  @JsonKey(name: "token")
  String ? token ;
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
  @JsonKey(name: "technical")
  TechnicalResponse ? technicalResponse ;

  AuthenticationResponse({required this.technicalResponse});

  factory AuthenticationResponse.fromJson(Map<String,dynamic> json) =>_$AuthenticationResponseFromJson(json);

  // to json
  Map<String,dynamic> toJson() =>
      _$AuthenticationResponseToJson(this);

}