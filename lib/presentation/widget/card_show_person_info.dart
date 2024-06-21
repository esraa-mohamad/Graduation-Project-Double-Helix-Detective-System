
import 'package:double_helix_detective_system/presentation/resource/color_manager.dart';
import 'package:double_helix_detective_system/presentation/resource/strings_manager.dart';
import 'package:double_helix_detective_system/presentation/resource/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../resource/assets_manager.dart';
import '../resource/font_manager.dart';



class CustomCardShowPersonInfo extends StatelessWidget {
  const CustomCardShowPersonInfo({ this.backgroundColor = ColorManager.background, super.key, required this.name, required this.address, required this.phone, required this.nationalId, required this.gender, required this.bloodType, required this.birthDate, required this.status, required this.description});

  final Color backgroundColor ;
  final String name ;
  final String address ;
  final String phone ;
  final String nationalId ;
  final String gender ;
  final String bloodType ;
  final String birthDate ;
  final String status ;
  final String description ;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: AppMargin.m100),
          decoration: BoxDecoration(
            color: backgroundColor,
            // Replace with your ColorManager.background
            borderRadius: BorderRadius.circular(AppSize.s16),
            boxShadow: const [
              BoxShadow(
                color: ColorManager.gray,
                blurRadius: AppSize.s4,
                spreadRadius: AppSize.s4,
              ),
            ],
            border: Border.all(
                color: ColorManager.gray,
                width: AppSize.s2
            ),
          ),
          padding: const EdgeInsets.all(AppPadding.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name.isEmpty?AppStrings.noName:name,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: FontSize.s40,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.home ,
                              size: AppSize.s25,
                              color: ColorManager.primary,
                            ),
                            const SizedBox(
                              width: AppSize.s4,
                            ),
                            Text(
                              address.isEmpty?AppStrings.noAddress:address ,
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontSize: FontSize.s40
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.phone ,
                              size: AppSize.s25,
                              color: ColorManager.primary,
                            ),
                            const SizedBox(
                              width: AppSize.s4,
                            ),
                            Text(
                              phone.isEmpty?AppStrings.noPhone:phone ,
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                fontSize: FontSize.s28
                              ),
                            ),
                            const SizedBox(
                              width: AppSize.s8,
                            ),
                            const Icon(
                              Icons.minimize_outlined ,
                              size: AppSize.s25,
                              color: ColorManager.white,
                            ),
                            const SizedBox(
                              width: AppSize.s4,
                            ),
                            const FaIcon(
                              FontAwesomeIcons.idCard,
                              size: AppSize.s25,
                              color: ColorManager.primary,
                            ),
                            const SizedBox(
                              width: AppSize.s4,
                            ),
                            Text(
                              nationalId.isEmpty?AppStrings.noNational:nationalId ,
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontSize: FontSize.s28
                              ),
                            ),

                          ],
                        ),
                        Row(
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.personHalfDress ,
                              size: AppSize.s25,
                              color: ColorManager.primary,
                            ),
                            const SizedBox(
                              width: AppSize.s4,
                            ),
                            Text(
                              gender.isEmpty?AppStrings.noGender:gender ,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(
                              width: AppSize.s8,
                            ),
                            const Icon(
                              Icons.minimize_outlined ,
                              size: AppSize.s25,
                              color: ColorManager.white,
                            ),
                            const SizedBox(
                              width: AppSize.s4,
                            ),
                            const FaIcon(
                              FontAwesomeIcons.handHoldingDroplet ,
                              size: AppSize.s25,
                              color: ColorManager.primary,
                            ),
                            const SizedBox(
                              width: AppSize.s4,
                            ),
                            Text(
                              bloodType.isEmpty?AppStrings.noBlood:bloodType,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                  Flexible(child: Image.asset(AssetsImageManager.cardId ,)),
                ],
              ),
              Container(
                height: AppSize.s1_5,
                color: ColorManager.gray,
              ),
              Text(
                description ,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.personCircleExclamation,
                        size: AppSize.s25,
                        color: ColorManager.primary,
                      ),
                      const SizedBox(
                        width: AppSize.s5,
                      ),
                      Text(
                        status,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_month ,
                        size: AppSize.s25,
                        color: ColorManager.primary,
                      ),
                      const SizedBox(
                        width: AppSize.s4,
                      ),
                      Text(
                        birthDate,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }


}
