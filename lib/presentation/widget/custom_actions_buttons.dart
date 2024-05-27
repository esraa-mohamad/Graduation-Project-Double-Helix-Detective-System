import 'package:flutter/material.dart';

import '../resource/routes_manager.dart';
import '../resource/strings_manager.dart';
import 'elevated_button.dart';
class CustomActionsButtons extends StatelessWidget {
  const CustomActionsButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomeElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(
                  context, RoutesManager.servicesPresentedRoute);
            },
            textButton: AppStrings.backSer),
        CustomeElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, RoutesManager.populationRoute);
            }, textButton: AppStrings.addDB),
      ],
    );
  }
}
