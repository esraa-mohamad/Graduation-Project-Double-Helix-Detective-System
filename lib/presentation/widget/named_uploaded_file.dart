import 'package:double_helix_detective_system/presentation/resource/color_manager.dart';
import 'package:flutter/material.dart';

import '../resource/values_manager.dart';

class NamedUploadedFile extends StatelessWidget {
  const NamedUploadedFile({super.key, required this.nameFile});

  final String nameFile ;
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Row(
        children: [
          const Icon(Icons.file_present_rounded, color: ColorManager.primary, size: AppSize.s25),
          Expanded(
            child: Text(
              'File Name: $nameFile',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
