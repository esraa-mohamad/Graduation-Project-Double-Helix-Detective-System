import 'dart:io';

import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

import 'app/app.dart';
import 'app/di.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  await windowManager.ensureInitialized();
  if (Platform.isWindows) {
    WindowManager.instance.setTitle('Double Helix Detective System');
    WindowManager.instance.setMinimumSize(const Size(1200, 700));
  }
  runApp(MyApp());
}


