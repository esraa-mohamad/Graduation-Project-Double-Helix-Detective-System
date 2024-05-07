import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';
import '../../data/network/requests.dart';
import '../models/models.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class CompareDnaUseCase
    extends BaseUseCase<CompareDnaUseCaseInput, CompareDna> {
  final Repository _repository;

  CompareDnaUseCase(this._repository);

  @override
  Future<Either<Failure, CompareDna>> execute(
      CompareDnaUseCaseInput input) async {
    return await _repository.compareDna(
      CompareDnaRequest(fileA: input.fileA, fileB: input.fileB),
    );
  }
}

class CompareDnaUseCaseInput {
  File fileA;
  File fileB;

  CompareDnaUseCaseInput({required this.fileA, required this.fileB});
}
