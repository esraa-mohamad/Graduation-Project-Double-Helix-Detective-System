import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';
import '../../data/network/requests.dart';
import '../models/models.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class SearchIdentificationUseCase
    extends BaseUseCase<SearchIdentificationUseCaseInput, SearchMatchingInfo> {
  final Repository _repository;

  SearchIdentificationUseCase(this._repository);

  @override
  Future<Either<Failure,SearchMatchingInfo>> execute(
      SearchIdentificationUseCaseInput input) async {
    return await _repository.searchMatchingInfo(
      IdentifySearchRequest(file: input.file, status:input.status),
    );
  }
}

class SearchIdentificationUseCaseInput{
 File file;
  String status;
 SearchIdentificationUseCaseInput({required this.file, required this.status});
}
