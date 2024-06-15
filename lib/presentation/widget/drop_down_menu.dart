import 'package:flutter/material.dart';

class CustomDropDownMenu extends StatelessWidget {
   const CustomDropDownMenu({
    required this.dropdownMenuEntries,
    required this.label,
    this.width,
    this.errorText,
    this.controller,
    super.key
  });

  final List<DropdownMenuEntry<dynamic>> dropdownMenuEntries;
  final Widget label ;
  final double? width;
  final String? errorText;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
        controller: controller,
        width: width,
        dropdownMenuEntries:dropdownMenuEntries,
        enableSearch: true,
        label: label,
        errorText: errorText,
    );
  }
}
