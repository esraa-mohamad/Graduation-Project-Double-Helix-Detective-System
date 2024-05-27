import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';
import '../../data/network/requests.dart';
import '../models/models.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class PaternityTestUseCase
    extends BaseUseCase<PaternityTestUseCaseInput, PaternityTest> {
  final Repository _repository;

  PaternityTestUseCase(this._repository);

  @override
  Future<Either<Failure, PaternityTest>> execute(
      PaternityTestUseCaseInput input) async {
    return await _repository.paternityTest(
      PaternityTestRequest(fileChild: input.fileChild, fileFather: input.fileFather)
    );
  }
}

class PaternityTestUseCaseInput {
  File fileChild;
  File fileFather;

  PaternityTestUseCaseInput({required this.fileChild, required this.fileFather});
}
