import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:double_helix_detective_system/data/network/requests.dart';
import 'package:double_helix_detective_system/domain/models/models.dart';

import '../../data/network/failure.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class MissingSearchUseCase
    extends BaseUseCase<MissingSearchUseCaseInput, AllMissingSearchResult> {
  final Repository _repository;

  MissingSearchUseCase(this._repository);

  @override
  Future<Either<Failure,AllMissingSearchResult>> execute(
      MissingSearchUseCaseInput input) async {
    return await _repository.missingSearch(
      MissingRequest(file: input.file),
    );
  }
}

class MissingSearchUseCaseInput{
  File file;
  MissingSearchUseCaseInput({required this.file});
}