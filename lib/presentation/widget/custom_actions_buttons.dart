import 'package:flutter/material.dart';

import '../resource/strings_manager.dart';
import 'elevated_button.dart';
class CustomActionsButtons extends StatelessWidget {
  const CustomActionsButtons({super.key,required this.onPressed, required this.onPressedAdd});
  final void Function()? onPressed;
  final void Function()? onPressedAdd ;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomeElevatedButton(
            onPressed: onPressed,
            textButton: AppStrings.backSer),
        CustomeElevatedButton(
            onPressed: onPressedAdd,
            textButton: AppStrings.addDB),
      ],
    );
  }
}
