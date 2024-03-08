import 'package:flutter/material.dart';

class CustomeTextField extends StatelessWidget {
   const CustomeTextField({
     required this.hintText ,
     required this.labelText ,
     this.errorText,
     this.keyboardType,
     this.controller,
     this.maxLines=1,
     this.suffixIcon,
     this.onTap,
     this.obscureText = false,
     super.key
   });

  final String hintText ;
  final String labelText ;
  final String?  errorText ;
  final TextInputType? keyboardType ;
  final TextEditingController? controller ;
  final int maxLines;
  final Widget? suffixIcon;
  final void Function()? onTap;
  final bool obscureText ;
  @override
  Widget build(BuildContext context) {
    return   TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      obscureText: obscureText,
      maxLines: maxLines,
      onTap: onTap,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        errorText: errorText,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
