import 'package:dio/dio.dart';
import 'package:double_helix_detective_system/app/app_prefs.dart';
import 'package:double_helix_detective_system/data/network/app_api.dart';
import 'package:double_helix_detective_system/data/network/network_info.dart';
import 'package:double_helix_detective_system/domain/usecase/add_population_usecase.dart';
import 'package:double_helix_detective_system/domain/usecase/compare_dna_usecase.dart';
import 'package:double_helix_detective_system/domain/usecase/logout_usecase.dart';
import 'package:double_helix_detective_system/domain/usecase/search_identification_usecase.dart';
import 'package:double_helix_detective_system/presentation/screens/services_presented/viewmodel/service_presented_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/data_source/remote_data_source.dart';
import '../data/network/dio_factory.dart';
import '../data/repository/repository_imp.dart';
import '../domain/repository/repository.dart';
import '../domain/usecase/login_usecase.dart';
import '../presentation/screens/Identification/compare_dna/viewmodel/compare_dna_viewmodel.dart';
import '../presentation/screens/Identification/search_database/viewmodel/search_database_viewmodel.dart';
import '../presentation/screens/login/viewModel/login_viewmodel.dart';
import '../presentation/screens/population/viewModel/population_viewmodel.dart';

final instance=GetIt.instance;
Future<void> initAppModule()async{
  instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImp(InternetConnectionChecker()));
  // for remote data source
  instance.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImp(instance(),instance()));

  final sharedPrefs = await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(
          ()=>sharedPrefs);

  // apps prefs instance
  instance.registerLazySingleton<AppPreferences>(
          () => AppPreferences(instance()));

  // for dio factory
  // final DioFactory dioFactory = DioFactory(null);
  // instance.registerLazySingleton<DioFactory>(() => dioFactory);
  // instance.registerLazySingleton<DioFactory>(() =>DioFactory(null));
  // Dio dio =await instance<DioFactory>().getDio();
  Dio dio = DioFactory.getDio();
  //for app service client
  instance.registerLazySingleton<AppServicesTechnical>(() =>AppServicesTechnical(dio) );
  instance.registerLazySingleton<AppServiceDna>(() =>AppServiceDna(dio) );

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
  if (!GetIt.I.isRegistered<AddPopulationUseCase>()) {
    instance.registerFactory<AddPopulationUseCase>(() =>
        AddPopulationUseCase(instance()));

    instance.registerFactory<PopulationViewModel>(() =>
        PopulationViewModel(instance()));
  }

}


initServicesModule() {
  if (!GetIt.I.isRegistered<LogoutUseCase>()) {
    instance.registerFactory<LogoutUseCase>(() => LogoutUseCase(instance()));

    instance.registerFactory<ServicePresentedViewModel>(() =>
        ServicePresentedViewModel(instance()));
  }
}


initCompareDnaModule() {
  if (!GetIt.I.isRegistered<CompareDnaUseCase>()) {
    instance.registerLazySingleton<CompareDnaUseCase>(() => CompareDnaUseCase(instance()));

    instance.registerLazySingleton<CompareDnaViewModel>(() =>
        CompareDnaViewModel(instance()));
  }
}

initSearchIdentificationModule() {
  if (!GetIt.I.isRegistered<SearchIdentificationUseCase>()) {
    instance.registerFactory<SearchIdentificationUseCase>(() => SearchIdentificationUseCase(instance()));

    instance.registerFactory<SearchDatabaseFormViewModel>(() =>
        SearchDatabaseFormViewModel(instance()));
  }
}
