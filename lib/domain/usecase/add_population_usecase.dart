import 'package:dartz/dartz.dart';
import 'package:double_helix_detective_system/data/network/failure.dart';
import 'package:double_helix_detective_system/data/network/requests.dart';
import 'package:double_helix_detective_system/domain/models/models.dart';
import 'package:double_helix_detective_system/domain/usecase/base_usecase.dart';

import '../repository/repository.dart';

class AddPopulationUseCase extends BaseUseCase<AddPopulationInput,AddPopulation> {

  final Repository _repository;

  AddPopulationUseCase(this._repository);

  @override
  Future<Either<Failure, AddPopulation>> execute(
      AddPopulationInput input) async {
    return await _repository.add(AddPopulationRequest(
        name: input.name,
        address: input.address,
        nationalId: input.nationalId,
        phone: input.phone,
        gender: input.gender,
        birthDate: input.birthDate,
        bloodType: input.bloodType,
        status: input.status,
        description: input.description,
        dnaSequence: input.dnaSequence));
  }
}

class AddPopulationInput {
  String name;

  String address;

  String nationalId;

  String phone;

  String gender;

  DateTime birthDate;

  String bloodType;

  String status;

  String description;

  String dnaSequence;

  AddPopulationInput({required this.name,
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