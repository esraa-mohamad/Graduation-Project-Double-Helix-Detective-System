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
      this?.technicalResponse.toDomain()
    );
  }
}
