import 'package:double_helix_detective_system/data/network/app_api.dart';
import 'package:double_helix_detective_system/data/network/requests.dart';

import '../responses/response.dart';

abstract class RemoteDataSource{
  Future<AuthenticationResponse>login(LoginRequest loginRequest);
}

class RemoteDataSourceImp implements RemoteDataSource{
  final AppServicesTechnical _appServicesTechnical;
  RemoteDataSourceImp(this._appServicesTechnical);
  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async{
     return await _appServicesTechnical.login(loginRequest.email, loginRequest.password);
  }

}