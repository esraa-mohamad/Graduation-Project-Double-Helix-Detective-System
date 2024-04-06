import 'package:dio/dio.dart';
import 'package:double_helix_detective_system/app/app_prefs.dart';
import 'package:double_helix_detective_system/data/network/app_api.dart';
import 'package:double_helix_detective_system/data/network/network_info.dart';
import 'package:double_helix_detective_system/data/responses/response.dart';
import 'package:double_helix_detective_system/domain/usecase/add_population_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/data_source/remote_data_source.dart';
import '../data/network/dio_factory.dart';
import '../data/repository/repository_imp.dart';
import '../domain/repository/repository.dart';
import '../domain/usecase/login_usecase.dart';
import '../presentation/screens/login/viewModel/login_viewmodel.dart';
import '../presentation/screens/population/viewModel/population_viewmodel.dart';

final instance=GetIt.instance;
Future<void> initAppModule()async{
  instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImp(InternetConnectionChecker()));
  // for remote data source
  instance.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImp(instance()));

  final sharedPrefs = await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(
          ()=>sharedPrefs);

  // apps prefs instance
  instance.registerLazySingleton<AppPreferences>(
          () => AppPreferences(instance()));

  // for dio factory
  instance.registerLazySingleton<DioFactory>(() =>DioFactory(null));
  Dio dio =await instance<DioFactory>().getDio();
  AuthenticationResponse authenticationResponse;
  //for app service client
  instance.registerLazySingleton<AppServicesTechnical>(() =>AppServicesTechnical(dio,authenticationResponse) );
  // for repository
  instance.registerLazySingleton<Repository>(() => RepositoryImp(instance(), instance()));
}

 initLoginModule() {
   if(!GetIt.I.isRegistered<LoginUseCase>()){
     // login use case
     instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));

     // login view model
     instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
   }
 }

initAddPopulationModule() {
  if(!GetIt.I.isRegistered<AddPopulationUseCase>()){
    // login use case
    instance.registerFactory<AddPopulationUseCase>(() => AddPopulationUseCase(instance()));

    // login view model
    instance.registerFactory<PopulationViewModel>(() => PopulationViewModel(instance()));
  }
}

