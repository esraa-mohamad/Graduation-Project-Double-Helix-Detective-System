import 'package:flutter/material.dart';

class CustomDropDownMenu extends StatelessWidget {
   const CustomDropDownMenu({
    required this.dropdownMenuEntries,
    required this.label,
    this.errorText,
    this.controller,
    super.key
  });

  final List<DropdownMenuEntry<dynamic>> dropdownMenuEntries;
  final Widget label ;
  final String? errorText;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context , constraints){
        return DropdownMenu(
          controller: controller,
          width: constraints.maxWidth,
          dropdownMenuEntries:dropdownMenuEntries,
          enableSearch: true,
          label: label,
          errorText: errorText,
        );
      }
    );
  }
}
