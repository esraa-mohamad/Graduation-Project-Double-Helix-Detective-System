import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {

  Future<bool> get isConnection;
}

class NetworkInfoImp implements NetworkInfo {

  final InternetConnectionChecker _internetConnectionChecker;

  NetworkInfoImp(this._internetConnectionChecker);

  @override
  Future<bool> get isConnection => _internetConnectionChecker.hasConnection;

}