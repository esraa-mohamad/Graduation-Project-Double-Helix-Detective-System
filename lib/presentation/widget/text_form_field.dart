import 'package:flutter/material.dart';

class CustomeTextField extends StatelessWidget {
   const CustomeTextField({
     required this.hintText ,
     required this.labelText ,
     super.key
   });

  final String hintText ;
  final String labelText ;

  @override
  Widget build(BuildContext context) {
    return   TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle:Theme.of(context).inputDecorationTheme.labelStyle,
        hintText: hintText,
        hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
        errorStyle: Theme.of(context).inputDecorationTheme.errorStyle,
        border: Theme.of(context).inputDecorationTheme.border,
        enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
        focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
        focusedErrorBorder: Theme.of(context).inputDecorationTheme.focusedErrorBorder,
        errorBorder: Theme.of(context).inputDecorationTheme.errorBorder,
      ),
    );
  }
}
