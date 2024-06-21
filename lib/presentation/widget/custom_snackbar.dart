import 'package:double_helix_detective_system/presentation/resource/font_manager.dart';
import 'package:double_helix_detective_system/presentation/resource/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../resource/assets_manager.dart';
import '../resource/color_manager.dart';
import '../resource/strings_manager.dart';

void showSnackBar(BuildContext context){
   ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: AppSize.s8,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
        backgroundColor:
        ColorManager.primary,
        duration: const Duration(seconds: 4),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Lottie.asset(
                AssetsLottiManager.addedSuccess,
                height: AppSize.s60,
                 width: AppSize.s60,
                repeat: true,
                reverse: false,
                animate: true),
            const SizedBox(width: AppSize.s12),
              Expanded(
              child: Text(
                AppStrings.addedSuccess,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: FontSize.s18,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close, color: ColorManager.white),
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),
          ],
        ),
      )
  );
}
