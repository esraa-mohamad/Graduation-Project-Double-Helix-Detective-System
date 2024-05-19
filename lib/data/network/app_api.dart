
import 'package:dio/dio.dart';
import 'package:double_helix_detective_system/app/constants.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../responses/response.dart';

part'app_api.g.dart'  ;
@RestApi(baseUrl: AppConstants.baseUrl)
abstract class AppServicesTechnical {

  factory AppServicesTechnical(Dio dio ,{String baseUrl}) = _AppServicesTechnical;
  
  @POST("/signintechnical")
  Future<AuthenticationResponse> login (
      @Field("email") String email ,
      @Field("password") String password
      );

  @POST("/api/addpopulation")
  @MultiPart()
  Future<AddPopulationResponse> add (
      // @Field("name") String name ,
      // @Field("address") String address ,
      // @Field("national_id") String nationalId ,
      // @Field("phone") String phone ,
      // @Field("gender") String gender ,
      // @Field("birthdate") DateTime birthDate ,
      // @Field("bloodType") String bloodType ,
      // @Field("status") String status ,
      // @Field("description") String description ,
      // @Part(name: "file") File dnaSequence,
      @Header("token")String token,
      @Body()FormData formData,
      // @Part(name: "name") String name,
      // @Part(name: "address") String address,
      // @Part(name: "national_id") String nationalId,
      // @Part(name: "phone") String phone,
      // @Part(name: "gender") String gender,
      // @Part(name: "birthdate") MyDateTime birthDate,
      // @Part(name: "bloodType") String bloodType,
      // @Part(name: "status") String status,
      // @Part(name: "description") String description,
      // @Part(name: "file") MultipartFile file
      );

  @PUT("/logout")
  Future<void>logout(
      @Header("token")String token
      );
}

@RestApi(baseUrl:AppConstants.baseUrlDna)
abstract class AppServiceDna{
  factory AppServiceDna(Dio dio ,{String baseUrl}) = _AppServiceDna;
  
  @POST('/compare')
  @MultiPart()
  Future<CompareDnaResponse> compareDna(
      @Body()FormData formData,
      );
  
  @POST('/identify')
  @MultiPart()
  Future<SearchMatchingInfoResponse> identificationSearch(
      @Body()FormData formData,
      );
}
