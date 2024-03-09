import 'package:double_helix_detective_system/presentation/resource/assets_manager.dart';
import 'package:double_helix_detective_system/presentation/resource/constants_manager.dart';
import 'package:double_helix_detective_system/presentation/resource/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../resource/color_manager.dart';
import '../../../../resource/strings_manager.dart';
import '../../../../resource/values_manager.dart';
import '../../../../widget/elevated_button.dart';

class PaternityTestResult extends StatelessWidget {
  const PaternityTestResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.lightBackground,
      appBar: AppBar(
        title: const Text(AppStrings.paternityResult),
        leading: IconButton(
          icon: const Icon(
              Icons.arrow_back_ios_outlined
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p20),
          child: Container(
            padding: const EdgeInsets.all(AppPadding.p18),
            width: double.infinity,
            decoration: const BoxDecoration(
                color: ColorManager.lightBlue,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(AppSize.s25),
                  bottomLeft: Radius.circular(AppSize.s25),
                ),
                boxShadow: [
                  BoxShadow(
                    color: ColorManager.shadow,
                    blurRadius: 25.0,
                    spreadRadius: 10,
                  )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(AssetsManager.family,
                    height: AppSize.s300,
                    width: AppSize.s300,
                    repeat: true,
                    reverse: false,
                    animate: true),
                const SizedBox(
                  height: AppSize.s20,
                ),
                RichText(
                  text: TextSpan(
                    text: "${AppStrings.matchResult} :- ",
                    style: Theme.of(context).textTheme.bodyLarge,
                    children: <TextSpan>[
                      TextSpan(
                          text: '${AppConstants.matchR} %',
                          style: Theme.of(context).textTheme.titleMedium),
                    ],
                  ),
                ),
                const SizedBox(
                  height: AppSize.s12,
                ),
                Text(
                  AppStrings.findFamily,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: AppSize.s40,
                ),
                Row(
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
