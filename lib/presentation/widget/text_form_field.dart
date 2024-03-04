import 'package:flutter/material.dart';

class CustomeTextField extends StatelessWidget {
   const CustomeTextField({
     required this.hintText ,
     required this.labelText ,
     this.errorText,
     this.keyboardType,
     this.controller,
     super.key
   });

  final String hintText ;
  final String labelText ;
  final String?  errorText ;
  final TextInputType? keyboardType ;
  final TextEditingController? controller ;
  @override
  Widget build(BuildContext context) {
    return   TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        errorText: errorText,
      ),
    );
  }
}
