import 'dart:io';

import 'package:dio/dio.dart';

import '../../app/constants.dart';
import 'app_api.dart';

class LoginRequest {
  String email;
  String password;

  LoginRequest(this.email, this.password);
}

class AddPopulationRequest {
  String token;
  String name;

  String address;

  String nationalId;

  String phone;

  String gender;

  DateTime birthDate;

  String bloodType;

  String status;

  String description;

  File dnaSequence;

  AddPopulationRequest({
    required this.token,
    required this.name,
    required this.address,
    required this.nationalId,
    required this.phone,
    required this.gender,
    required this.birthDate,
    required this.bloodType,
    required this.status,
    required this.description,
    required this.dnaSequence});

  // form data of body

  FormData toFormData() {
    MyDateTime myBirthDate = MyDateTime(birthDate);
    FormData formData = FormData.fromMap({
      'status': status,
      'description': description,
      'file': [
        MultipartFile.fromString(
            dnaSequence.readAsStringSync(), filename: dnaSequence.path)
      ],
      if(name.isNotEmpty)
        'name': name,
      if(address.isNotEmpty)
        'address': address,
      if(nationalId.isNotEmpty)
        'nationalId': nationalId,
      if(phone.isNotEmpty)
        'phone': phone,
      if(gender.isNotEmpty)
        'gender': gender,
      // if(myBirthDate.toJson().isNotEmpty )
      //   'birthDate': myBirthDate.toJson(),
      // Convert DateTime to String
      if(bloodType.isNotEmpty)
       'bloodType': bloodType,
    });
    return formData;
  }
}
class LogoutRequest{
  String token;
  LogoutRequest(this.token);
}

//   FormData toFormData() {
//     MyDateTime myBirthDate = MyDateTime(birthDate);
//     FormData formData = FormData.fromMap({
//       if(name.isNotEmpty)
//         'name': name,
//       // 'address': address,
//       // 'nationalId': nationalId,
//       // 'phone': phone,
//       // 'gender': gender,
//       // 'birthDate': myBirthDate, // Convert DateTime to String
//       // 'bloodType': bloodType,
//       'status': status,
//       'description': description,
//       'file': [
//         MultipartFile.fromString(
//           dnaSequence.path,
//           filename: dnaSequence.path,
//         )
//       ],
//     });
//     return formData;
//   }
// }
