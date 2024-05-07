import 'package:dartz/dartz.dart';
import 'package:double_helix_detective_system/data/network/requests.dart';
import 'package:double_helix_detective_system/domain/models/models.dart';

import '../../data/network/failure.dart';

abstract class Repository{
  Future<Either<Failure,Authentication>>login(LoginRequest loginRequest);
  Future<Either<Failure,AddPopulation>>add(AddPopulationRequest addPopulationRequest);
  Future<Either<Failure,void>>logout(LogoutRequest logoutRequest);
  Future<Either<Failure,CompareDna>>compareDna(CompareDnaRequest compareDnaRequest);
}