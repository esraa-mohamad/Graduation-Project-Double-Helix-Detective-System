import 'package:flutter/material.dart';

class CustomeElevatedButton extends StatelessWidget {
  const CustomeElevatedButton({required this.onPressed , required this.textButton , super.key});

  final String textButton;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child:  Text(
        textButton,
      ),
    );
  }
}
