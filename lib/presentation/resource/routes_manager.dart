
import 'package:double_helix_detective_system/presentation/resource/strings_manager.dart';
import 'package:double_helix_detective_system/presentation/screens/Identification/form/compare_dna/views/compare_dna_view.dart';
import 'package:double_helix_detective_system/presentation/screens/Identification/form/compare_dna/views/compare_result_view.dart';
import 'package:double_helix_detective_system/presentation/screens/choose_identification_case/views/choose_identification_case_view.dart';
import 'package:double_helix_detective_system/presentation/screens/on_boarding/view/onboarding_view.dart';
import 'package:flutter/material.dart';
import '../../app/di.dart';
import '../screens/Identification/form/search_database/view/search_database_view.dart';
import '../screens/Identification/result/search_result/view/identification_result_view.dart';
import '../screens/login/view/login_view.dart';
import '../screens/missing_persons/form/view/missing_persons_form_view.dart';
import '../screens/missing_persons/result/view/missing_persons_result_view.dart';
import '../screens/paternity_test/form/view/paternity_test_form_view.dart';
import '../screens/paternity_test/result/view/paternity_test_result_view.dart';
import '../screens/population/view/population_view.dart';
import '../screens/services_presented/view/service_presented_view.dart';
import '../screens/splash/splash_view.dart';

class RoutesManager{
  static const String splashRoute='/';
  static const String onBoardingRoute='/onBoarding';
  static const String loginRoute='/login';
  static const String servicesPresentedRoute='/servicesPresented';
  static const String paternityFormRoute='/paternityForm';
  static const String paternityResultRoute='/paternityResult';
  static const String searchFormRoute='/identificationForm';
  static const String searchResultRoute='/identificationResult';
  static const String compareDnaFormRoute='/compareDnaForm';
  static const String compareDnaResultRoute='/compareDnaResult';

  static const String missingPersonFormRoute='/missingPersonForm';
  static const String missingPersonResultRoute='/missingPersonResult';
  static const String populationRoute='/population';
  static const String chooseIdentificationCase='/chooseIdentification';
}

class RouteGenerator{
  static Route<dynamic>getRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesManager.splashRoute:
        return MaterialPageRoute(builder: (_)=>const SplashView());
      case RoutesManager.onBoardingRoute:
        return MaterialPageRoute(builder: (_)=>const OnBoarding());
      case RoutesManager.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_)=>const LoginView());
      case RoutesManager.servicesPresentedRoute:
        initServicesModule();
        return MaterialPageRoute(builder: (_)=>const ServicesView());
      case RoutesManager.paternityFormRoute:
        return MaterialPageRoute(builder: (_)=>const PaternityTestForm());
      case RoutesManager.paternityResultRoute:
        return MaterialPageRoute(builder: (_)=>const PaternityTestResult());
      case RoutesManager.searchFormRoute:
        return MaterialPageRoute(builder: (_)=>const SearchDatabaseFormView());
      case RoutesManager.searchResultRoute:
        return MaterialPageRoute(builder: (_)=>const IdentificationResult());
      case RoutesManager.missingPersonFormRoute:
        return MaterialPageRoute(builder: (_)=>const MissingForm());
      case RoutesManager.missingPersonResultRoute:
        return MaterialPageRoute(builder: (_)=>const MissingResult());
      case RoutesManager.populationRoute:
        initAddPopulationModule();
        return MaterialPageRoute(builder: (_)=>const PopulationView());
      case RoutesManager.chooseIdentificationCase:
        return MaterialPageRoute(builder: (_)=>const ChooseIdentificationView());
      case RoutesManager.compareDnaFormRoute:
        initCompareDnaModule();
        return MaterialPageRoute(builder: (_)=>const CompareDnaFormView());
      case RoutesManager.compareDnaResultRoute :
        initCompareDnaModule();
        return MaterialPageRoute(builder: (_)=>const CompareDnaResultView());

      default :return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(builder: (_){
      return Scaffold(
       appBar:AppBar(  title: const Text(
          AppStrings.noDefinedRoute),
      ),
      body: const Center(
      child: Text(
      AppStrings.noDefinedRoute)),
      );
    });
  }
}