import 'dart:io';

import 'package:dio/dio.dart';
import 'package:double_helix_detective_system/app/constants.dart';
import 'package:retrofit/http.dart';

import '../responses/response.dart';

part'app_api.g.dart'  ;
@RestApi(baseUrl: AppConstants.baseUrl)
abstract class AppServicesTechnical {

  factory AppServicesTechnical(Dio dio , {String baseUrl}) = _AppServicesTechnical;
  
  @POST("/signintechnical")
  Future<AuthenticationResponse> login (
      @Field("email") String email ,
      @Field("password") String password
      );
  
  @POST("/addpopulation")
  Future<AddPopulationResponse> add (
      @Field("name") String name ,
      @Field("address") String address ,
      @Field("national_id") String nationalId ,
      @Field("phone") String phone ,
      @Field("gender") String gender ,
      @Field("birthdate") DateTime birthDate ,
      @Field("bloodType") String bloodType ,
      @Field("status") String status ,
      @Field("description") String description ,
      @Part(fileName: "file") File dnaSequence ,
      );

}