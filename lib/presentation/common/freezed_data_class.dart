// ignore: depend_on_referenced_packages
import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'freezed_data_class.freezed.dart';


@freezed
class LoginObject with _$LoginObject {

  factory LoginObject({required String email ,required String password}) = _LoginObject ;
}

@freezed
class PopulationObject with _$PopulationObject{
  factory PopulationObject({
    required String name,
    required String address,
    required String nationalId,
    required String phone,
    required String gender,
    required DateTime birthDate,
    required String bloodType,
    required String status,
    required String description,
    required File dnaSequence
})=_populationObject;
}