import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';
import '../../data/network/requests.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class LogoutUseCase extends BaseUseCase<LogoutUseCaseInput,void>{
  final Repository _repository;
  LogoutUseCase(this._repository);
  @override
  Future<Either<Failure, void>> execute(LogoutUseCaseInput input) async{
    return await _repository.logout(LogoutRequest(input.token));
  }

}

class LogoutUseCaseInput{
  String token;
  LogoutUseCaseInput(this.token);
}