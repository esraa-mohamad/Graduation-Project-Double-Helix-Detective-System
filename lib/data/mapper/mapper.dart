import 'package:double_helix_detective_system/app/constants.dart';
import 'package:double_helix_detective_system/app/extentions.dart';
import 'package:double_helix_detective_system/data/responses/response.dart';
import 'package:double_helix_detective_system/domain/models/models.dart';

extension TechnicalResponseMapper on TechnicalResponse? {
  Technical toDomain() {
    return Technical(
      this?.userName.orEmpty() ?? AppConstants.empty,
      this?.phone.orEmpty() ?? AppConstants.empty,
    );
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(
      this?.technicalResponse.toDomain(),
      this?.token.orEmpty() ?? AppConstants.empty,
      this?.expiresIn.orEmpty() ?? AppConstants.empty,
    );
  }
}

extension PopulationResponseMapper on PopulationResponse?{
  Population toDomain() {
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
extension CompareDnaMapper on CompareDnaResponse?{
  CompareDna toDomain() {
    return CompareDna(match: this?.match.orEmpty() ?? AppConstants.empty,
        similarity: this?.similarity.orZero() ?? AppConstants.zero);
  }
}

extension PersonInfoResponseMapper on PersonInfoResponse?{
  PersonInfo toDomain() {
    return PersonInfo(
        name: this?.name.orEmpty() ?? AppConstants.empty,
        address: this?.address.orEmpty() ?? AppConstants.empty,
        phone: this?.phone.orEmpty() ?? AppConstants.empty,
        nationalId: this?.nationalId.orEmpty() ?? AppConstants.empty,
        gender: this?.gender.orEmpty() ?? AppConstants.empty,
        bloodType: this?.bloodType.orEmpty() ?? AppConstants.empty,
        birthDate: this?.birthDate.orEmpty() ?? AppConstants.empty,
        status: this?.status.orEmpty() ?? AppConstants.empty,
        description: this?.description.orEmpty() ?? AppConstants.empty
    );
  }
}

extension SearchMatchingInfoResponseMapper on SearchMatchingInfoResponse?{
  SearchMatchingInfo toDomain(){
    return SearchMatchingInfo(
        personInfo: this?.personInfoResponse.toDomain(),
        match: this?.matchStatus.orEmpty() ?? AppConstants.empty,
        similarity: this?.similarity.orZero() ?? AppConstants.zero
    );
  }
}