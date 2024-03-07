import 'package:double_helix_detective_system/presentation/resource/values_manager.dart';
import 'package:flutter/material.dart';

import '../../../../resource/color_manager.dart';
import '../../../../resource/strings_manager.dart';
class MissingResult extends StatefulWidget {
  const MissingResult({super.key});

  @override
  State<MissingResult> createState() => _MissingResultState();
}

class _MissingResultState extends State<MissingResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.missingResult.toUpperCase(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(AppPadding.p18),
                width: AppSize.s400,
                height: AppSize.s400,
                decoration:  BoxDecoration(
                    color:ColorManager.background,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(AppSize.s25),
                      bottomLeft: Radius.circular(AppSize.s25),
                    ),
                    boxShadow:const [
                      BoxShadow(
                        color: ColorManager.shadow,
                        blurRadius: 25.0,
                        spreadRadius: 10,
                      )
                    ],
                    border: Border.all(
                    width: 6,
                    color: ColorManager.lightBackground
                  )
                ),
                child: Column(
                  children: [
                    Text(
                      AppStrings.fatherRelative,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(AppPadding.p18),
                width: AppSize.s400,
                height: AppSize.s400,
                decoration:  BoxDecoration(
                    color:ColorManager.background,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(AppSize.s25),
                      bottomLeft: Radius.circular(AppSize.s25),
                    ),
                    boxShadow:const [
                      BoxShadow(
                        color: ColorManager.shadow,
                        blurRadius: 25.0,
                        spreadRadius: 10,
                      )
                    ],
                    border: Border.all(
                        width: 6,
                        color: ColorManager.lightBackground
                    )
                ),
                child: Column(
                  children: [
                    Text(
                      AppStrings.motherRelative,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ],
                ),

              ),
              Container(
                padding: const EdgeInsets.all(AppPadding.p18),
                width: AppSize.s400,
                height: AppSize.s400,
                decoration:  BoxDecoration(
                    color:ColorManager.background,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(AppSize.s25),
                      bottomLeft: Radius.circular(AppSize.s25),
                    ),
                    boxShadow:const [
                      BoxShadow(
                        color: ColorManager.shadow,
                        blurRadius: 25.0,
                        spreadRadius: 10,
                      )
                    ],
                    border: Border.all(
                        width: 6,
                        color: ColorManager.lightBackground
                    )
                ),
                child: Column(
                  children: [
                    Text(
                      AppStrings.person,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
