// import 'package:dio/dio.dart';
// import 'package:double_helix_detective_system/app/constants.dart';
// import 'package:flutter/foundation.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';
//
// import '../responses/response.dart';
//
// const String APPLICATION_JSON = "application_json";
// const String CONTENT_TYPE = "content_type";
// const String ACCEPT = "accept";
// const String AUTHORIZATION = "authorization";
//
// class DioFactory{
//   final AuthenticationResponse? _authenticationResponse;
//
//   DioFactory(this._authenticationResponse);
//   Future<Dio> getDio() async{
//     Dio dio = Dio();
//     Map<String , String> headers= {
//       CONTENT_TYPE : APPLICATION_JSON,
//       ACCEPT : APPLICATION_JSON ,
//       AUTHORIZATION:token
//     };
//     String? token = _authenticationResponse?.token;
//     // Debug: Print token to verify retrieval
//     print("Token: $token");
//     headers[AUTHORIZATION] = "$token";
//     // Add token to headers if available
//     // if (token != null && token.isNotEmpty) {
//     //
//     // }
//
//     // Debug: Print headers to verify token inclusion
//     print("Headers: $headers");
//     dio.options = BaseOptions(
//       baseUrl: AppConstants.baseUrl ,
//       headers:  headers,
//       receiveTimeout:  AppConstants.apiTimeOut,
//       sendTimeout: AppConstants.apiTimeOut,
//     );
//
//     if(!kReleaseMode){
//       dio.interceptors.add(PrettyDioLogger(
//           requestHeader: true,
//           requestBody: true,
//           responseHeader: true
//       ));
//     }
//
//
//     return dio;
//   }
// }
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory{

  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }
  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
