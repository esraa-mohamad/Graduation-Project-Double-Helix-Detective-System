import 'package:dio/dio.dart';
import 'package:double_helix_detective_system/app/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../responses/response.dart';

const String APPLICATION_JSON = "application_json";
const String CONTENT_TYPE = "content_type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";

class DioFactory{
  final AuthenticationResponse? _authenticationResponse;

  DioFactory(this._authenticationResponse);
  Future<Dio> getDio() async{

     String? token = _authenticationResponse?.token;
    Dio dio = Dio();
    Map<String , String> headers= {
      CONTENT_TYPE : APPLICATION_JSON,
      ACCEPT : APPLICATION_JSON ,
    };
     if (token != null) {
       headers[AUTHORIZATION] = token;
     }
    dio.options = BaseOptions(
      baseUrl: AppConstants.baseUrl ,
      headers:  headers,
      receiveTimeout:  AppConstants.apiTimeOut,
      sendTimeout: AppConstants.apiTimeOut,
    );

    if(!kReleaseMode){
      dio.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true
      ));
    }

    return dio;
  }
}