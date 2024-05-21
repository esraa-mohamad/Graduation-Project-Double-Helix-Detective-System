
import 'package:double_helix_detective_system/presentation/resource/color_manager.dart';
import 'package:double_helix_detective_system/presentation/resource/values_manager.dart';
import 'package:flutter/material.dart';

import '../resource/strings_manager.dart';



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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                decoration: BoxDecoration(
                  color: backgroundColor, // Replace with your ColorManager.background
                  borderRadius: BorderRadius.circular(AppSize.s16),
                  boxShadow: const [
                    BoxShadow(
                      color: ColorManager.gray,
                      blurRadius: AppSize.s4,
                      spreadRadius: AppSize.s4,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildRichText(
                            context,
                            label: AppStrings.namePerson,
                            value: name,
                          ),
                          _buildRichText(
                            context,
                            label: AppStrings.addressPerson,
                            value: address,
                          ),
                          _buildRichText(
                            context,
                            label: AppStrings.genderPerson,
                            value: gender,
                          ),
                          _buildRichText(
                            context,
                            label: AppStrings.bloodPerson,
                            value: bloodType,
                          ),
                          _buildRichText(
                            context,
                            label: AppStrings.descriptionPerson,
                            value: description,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Flexible(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildRichText(
                            context,
                            label: AppStrings.phonePerson,
                            value: phone,
                          ),
                          _buildRichText(
                            context,
                            label: AppStrings.nationalIdPerson,
                            value: nationalId,
                          ),
                          _buildRichText(
                            context,
                            label: AppStrings.birthdayPerson,
                            value: birthDate,
                          ),
                          _buildRichText(
                            context,
                            label: AppStrings.statusPerson,
                            value: status,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildRichText(BuildContext context, {required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: RichText(
        text: TextSpan(
          text: "$label: ",
          style: Theme
              .of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.bold),
          children: <TextSpan>[
            TextSpan(
              text: value,
              style: Theme
                  .of(context)
                  .textTheme
                  .titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
