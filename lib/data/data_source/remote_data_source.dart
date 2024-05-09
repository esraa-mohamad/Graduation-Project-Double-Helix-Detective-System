
import 'package:double_helix_detective_system/data/network/app_api.dart';
import 'package:double_helix_detective_system/data/network/requests.dart';

import '../responses/response.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);

  Future<AddPopulationResponse> add(AddPopulationRequest addPopulationRequest);
   Future<void> logout(LogoutRequest logoutRequest);

  Future<CompareDnaResponse> compareDna(CompareDnaRequest compareDnaRequest);

  Future<SearchMatchingInfoResponse> identificationSearch(IdentifySearchRequest identifySearchRequest);
}

class RemoteDataSourceImp implements RemoteDataSource {
  final AppServicesTechnical _appServicesTechnical;
  final AppServiceDna _appServiceDna;
  RemoteDataSourceImp(this._appServicesTechnical,this._appServiceDna);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await _appServicesTechnical.login(
        loginRequest.email, loginRequest.password);
  }

  @override
  Future<AddPopulationResponse> add(
      AddPopulationRequest addPopulationRequest) async {

    //*** هنرجع له لما نحتاجه ***

    //MyDateTime myBirthDate = MyDateTime(addPopulationRequest.birthDate);
    //  var formData=FormData.fromMap({
    //   'file': await MultipartFile.fromFile(addPopulationRequest.dnaSequence.path, filename: '')
    //   ,
    // });
    // var formData = await MultipartFile.fromFile(addPopulationRequest.dnaSequence.path, filename: '');

    return await _appServicesTechnical.add(
      addPopulationRequest.token,
        addPopulationRequest.toFormData(),
        // addPopulationRequest.toFormData(),
        // addPopulationRequest.name,
        // addPopulationRequest.address,
        // addPopulationRequest.nationalId,
        // addPopulationRequest.phone,
        // addPopulationRequest.gender,
        // myBirthDate,
        // addPopulationRequest.bloodType,
        // addPopulationRequest.status,
        // addPopulationRequest.description,
        // file,
    );
  }

  @override
  Future<void> logout(LogoutRequest logoutRequest)async {
    return await _appServicesTechnical.logout(logoutRequest.token);
  }

  @override
  Future<CompareDnaResponse> compareDna(CompareDnaRequest compareDnaRequest)async  {
    return await _appServiceDna.compareDna(
     compareDnaRequest.toFormData()
    );
  }

  @override
  Future<SearchMatchingInfoResponse> identificationSearch(IdentifySearchRequest identifySearchRequest)async  {
    return await _appServiceDna.identificationSearch(
      identifySearchRequest.toFormData(),
    );
  }

}