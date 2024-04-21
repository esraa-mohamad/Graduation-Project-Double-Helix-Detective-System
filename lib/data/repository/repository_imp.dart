import 'package:dartz/dartz.dart';
import 'package:double_helix_detective_system/data/data_source/remote_data_source.dart';
import 'package:double_helix_detective_system/data/mapper/mapper.dart';
import 'package:double_helix_detective_system/data/network/failure.dart';
import 'package:double_helix_detective_system/data/network/network_info.dart';
import 'package:double_helix_detective_system/data/network/requests.dart';
import 'package:double_helix_detective_system/domain/models/models.dart';
import 'package:double_helix_detective_system/domain/repository/repository.dart';

import '../network/error_handler.dart';

class RepositoryImp implements Repository{

  final NetworkInfo _networkInfo;
  final RemoteDataSource _remoteDataSource;

  RepositoryImp(this._networkInfo , this._remoteDataSource);

  @override
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest) async {
    if(await _networkInfo.isConnection){
      try {
        final response = await _remoteDataSource.login(loginRequest);
        if(response.status == ApiInternalStatus.SUCCESS){
          // success
          // either right
          // return data
          return Right(response.toDomain());
        }else{
          // failure
          // either left
          //return business error
          return Left(Failure(
              status:  response.status ?? ResponseStatus.DEFAULT ,
              message: response.message ?? ResponseMessage.DEFAULT
          ));
        }
      }catch(error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    }else{
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, AddPopulation>> add(AddPopulationRequest addPopulationRequest) async {
    if(await _networkInfo.isConnection){
      try {
        final response = await _remoteDataSource.add(addPopulationRequest);
        if(response.status == ApiInternalStatus.SUCCESSPOPULATION){
          // success
          // either right
          // return data
          return Right(response.toDomain());
        }else{
          // failure
          // either left
          //return business error
          return Left(Failure(
              status:  response.status ?? ResponseStatus.DEFAULT ,
              message: response.message ?? ResponseMessage.DEFAULT
          ));
        }
      }catch(error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    }else{
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, void>> logout(LogoutRequest logoutRequest) async {
    if (await _networkInfo.isConnection) {
      try {
        final response = await _remoteDataSource.logout(logoutRequest);
        // Assuming response handling logic here
        return const Right(null); // Return Right with void value
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

}