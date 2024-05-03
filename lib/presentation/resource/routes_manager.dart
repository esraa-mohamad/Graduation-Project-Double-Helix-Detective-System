
import 'package:double_helix_detective_system/presentation/resource/strings_manager.dart';
import 'package:double_helix_detective_system/presentation/screens/on_boarding/view/onboarding_view.dart';
import 'package:flutter/material.dart';
import '../../app/di.dart';
import '../screens/Identification/form/view/identification_form_view.dart';
import '../screens/Identification/result/view/identification_result_view.dart';
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
  static const String identificationFormRoute='/identificationForm';
  static const String identificationResultRoute='/identificationResult';
  static const String missingPersonFormRoute='/missingPersonForm';
  static const String missingPersonResultRoute='/missingPersonResult';
  static const String populationRoute='/population';
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
      case RoutesManager.identificationFormRoute:
        return MaterialPageRoute(builder: (_)=>const IdentificationForm());
      case RoutesManager.identificationResultRoute:
        return MaterialPageRoute(builder: (_)=>const IdentificationResult());
      case RoutesManager.missingPersonFormRoute:
        return MaterialPageRoute(builder: (_)=>const MissingForm());
      case RoutesManager.missingPersonResultRoute:
        return MaterialPageRoute(builder: (_)=>const MissingResult());
      case RoutesManager.populationRoute:
        initAddPopulationModule();
        return MaterialPageRoute(builder: (_)=>const PopulationView());

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