import 'package:double_helix_detective_system/app/constants.dart';
import 'package:double_helix_detective_system/app/extentions.dart';
import 'package:double_helix_detective_system/data/responses/response.dart';
import 'package:double_helix_detective_system/domain/models/models.dart';

extension TechnicalResponseMapper on TechnicalResponse? {
  Technical toDomain() {
    return Technical(
      this?.userName.orEmpty()??AppConstants.empty,
      this?.phone.orEmpty()??AppConstants.empty,
    );
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(
      this?.technicalResponse.toDomain(),
      this?.token.orEmpty() ?? AppConstants.empty,
      this?.expiresIn.orEmpty()??AppConstants.empty,
    );
  }
}

extension PopulationResponseMapper on PopulationResponse?{
  Population toDomain(){
    return Population(
        name: this?.name.orEmpty() ?? AppConstants.empty,
        address: this?.address.orEmpty() ?? AppConstants.empty,
        nationalId: this?.nationalId.orEmpty() ?? AppConstants.empty,
        status: this?.statusPerson.orEmpty() ?? AppConstants.empty
    );
  }
}

extension AddPopulationResponseMapper on AddPopulationResponse? {
  AddPopulation toDomain() {
    return AddPopulation(
        this?.populationResponse.toDomain()
    );
  }
}