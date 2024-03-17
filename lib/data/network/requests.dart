
import 'dart:io';

class LoginRequest {
  String email;
  String password;

  LoginRequest(this.email, this.password);
}

class AddPopulationRequest {
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
      {required this.name,
      required this.address,
      required this.nationalId,
      required this.phone,
      required this.gender,
      required this.birthDate,
      required this.bloodType,
      required this.status,
      required this.description,
      required this.dnaSequence});
}
