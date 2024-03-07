import 'package:flutter/material.dart';
import '../presentation/resource/routes_manager.dart';
import '../presentation/resource/theme_manager.dart';

class MyApp extends StatefulWidget {
  // named constructor
  const MyApp._internal();
  //singleton
  static const MyApp _instance= MyApp._internal();
  //factory
  factory MyApp()=>_instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
      onGenerateRoute:RouteGenerator.getRoute ,
      initialRoute: RoutesManager.splashRoute,
    );
  }
}
