
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
      @Header("token")String token,
      @Body()FormData formData,
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
    @Body() FormData formData,
  );

  @POST('/identify')
  @MultiPart()
  Future<SearchMatchingInfoResponse> identificationSearch(
    @Body() FormData formData,
  );

  @POST('/missing')
  @MultiPart()
  Future<AllMissingSearchResultResponse> missingSearch(
    @Body() FormData formData,
  );

  @POST('/predict')
  @MultiPart()
  Future<PaternityTestResponse> paternityTest(
      @Body() FormData formData,
      );
}
