import 'package:flutter/material.dart';

import 'app/app.dart';
import 'app/di.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  initLoginModuleOnce();
  runApp(MyApp());
}
bool _isLoginModuleInitialized = false;

void initLoginModuleOnce() {
  //check init login module
  if (!_isLoginModuleInitialized) {
    // Ensure initAppModule is called before initLoginModule
    initAppModule();

    // Initialize login module only if it hasn't been initialized before
    initLoginModule();

    _isLoginModuleInitialized = true;
  }
}


