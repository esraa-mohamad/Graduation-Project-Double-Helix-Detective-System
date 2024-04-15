import 'package:dio/dio.dart';
import 'package:double_helix_detective_system/data/network/app_api.dart';
import 'package:double_helix_detective_system/data/network/requests.dart';

import '../responses/response.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);

  Future<AddPopulationResponse> add(AddPopulationRequest addPopulationRequest);
}

class RemoteDataSourceImp implements RemoteDataSource {
  final AppServicesTechnical _appServicesTechnical;

  RemoteDataSourceImp(this._appServicesTechnical);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await _appServicesTechnical.login(
        loginRequest.email, loginRequest.password);
  }

  @override
  Future<AddPopulationResponse> add(
      AddPopulationRequest addPopulationRequest) async {
    MyDateTime myBirthDate = MyDateTime(addPopulationRequest.birthDate);
    //  var formData=FormData.fromMap({
    //   'file': await MultipartFile.fromFile(addPopulationRequest.dnaSequence.path, filename: '')
    //   ,
    // });
    MultipartFile file = await MultipartFile.fromFile(addPopulationRequest.dnaSequence.path, filename: '');
    return await _appServicesTechnical.add(
      addPopulationRequest.token,
        addPopulationRequest.name,
        addPopulationRequest.address,
        addPopulationRequest.nationalId,
        addPopulationRequest.phone,
        addPopulationRequest.gender,
        myBirthDate,
        addPopulationRequest.bloodType,
        addPopulationRequest.status,
        addPopulationRequest.description,
        file,
    );
  }


}