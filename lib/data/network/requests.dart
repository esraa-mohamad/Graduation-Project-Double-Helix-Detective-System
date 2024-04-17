
import 'dart:io';

import 'package:dio/dio.dart';

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

  AddPopulationRequest(
      {required this.token,
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



  FormData toFormData() {
    MyDateTime myBirthDate = MyDateTime(birthDate);
    FormData formData = FormData.fromMap({
      if(name.isNotEmpty)
        'name': name,
      // 'address': address,
      // 'nationalId': nationalId,
      // 'phone': phone,
      // 'gender': gender,
      // 'birthDate': myBirthDate, // Convert DateTime to String
      // 'bloodType': bloodType,
      'status': status,
      'description': description,
      'file': [
        MultipartFile.fromString(
          dnaSequence.path,
          filename: dnaSequence.path,
        )
      ],
    });
    return formData;
  }
}
