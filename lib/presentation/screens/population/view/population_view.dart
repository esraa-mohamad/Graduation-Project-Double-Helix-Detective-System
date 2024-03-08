import 'package:double_helix_detective_system/presentation/resource/color_manager.dart';
import 'package:double_helix_detective_system/presentation/resource/strings_manager.dart';
import 'package:double_helix_detective_system/presentation/resource/values_manager.dart';
import 'package:double_helix_detective_system/presentation/widget/elevated_button.dart';
import 'package:double_helix_detective_system/presentation/widget/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../widget/drop_down_menu.dart';
class PopulationView extends StatefulWidget {
  const PopulationView({super.key});

  @override
  State<PopulationView> createState() => _PopulationViewState();
}

class _PopulationViewState extends State<PopulationView> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _nationalIdController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _datePickerBirthdayController = TextEditingController();
  final TextEditingController _bloodController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dnaController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.lightBackground,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
              Icons.arrow_back_ios_outlined
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text(
          AppStrings.addPopulation.toUpperCase(),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child:  Padding(
            padding: const EdgeInsets.all(AppPadding.p18),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: AppPadding.p12),
                        child: CustomeTextField(
                            keyboardType: TextInputType.text,
                            controller: _nameController,
                            hintText: AppStrings.namePerson,
                            labelText: AppStrings.namePerson
                        ),
                      ),
                    ),
                     Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: AppPadding.p12),
                        child: CustomeTextField(
                            keyboardType: TextInputType.text,
                            controller: _addressController,
                            hintText: AppStrings.addressPerson,
                            labelText: AppStrings.addressPerson
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: AppSize.s25,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: AppPadding.p12),
                        child: CustomeTextField(
                            keyboardType: TextInputType.number,
                            controller: _nationalIdController,
                            hintText: AppStrings.nationalIdPerson,
                            labelText: AppStrings.nationalIdPerson,

                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: AppPadding.p12),
                        child: CustomeTextField(
                            keyboardType: TextInputType.phone,
                            controller: _phoneController,
                            hintText: AppStrings.phonePerson,
                            labelText: AppStrings.phonePerson,
                            suffixIcon: const Icon(
                                Icons.phone
                            ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: AppSize.s25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                        child: Padding(
                            padding: const EdgeInsets.only(right: AppPadding.p12),
                            child: CustomDropDownMenu(
                              controller: _genderController,
                              width: MediaQuery.of(context).size.width / 2.08,
                              dropdownMenuEntries:const <DropdownMenuEntry<String>>
                              [
                                DropdownMenuEntry(
                                    value: AppStrings.malePerson,
                                    label: AppStrings.malePerson,
                                ),
                                DropdownMenuEntry(
                                  value: AppStrings.femalePerson,
                                  label: AppStrings.femalePerson,
                                ),
                              ],
                              onSelected: (gender) {},
                              label: Text(
                                AppStrings.genderPerson,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                        ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: AppPadding.p12),
                        child:CustomeTextField(
                          keyboardType: TextInputType.datetime,
                          controller: _datePickerBirthdayController,
                          hintText: AppStrings.birthdayPerson,
                          labelText: AppStrings.birthdayPerson,
                          suffixIcon: const Icon(
                            Icons.calendar_month,
                          ),
                          onTap: ()=> onTapFunction(context: context),
                        )
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: AppSize.s25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: AppPadding.p12),
                        child: CustomDropDownMenu(
                          controller: _bloodController,
                          width: MediaQuery.of(context).size.width / 2.08,
                          dropdownMenuEntries:const <DropdownMenuEntry<String>>
                          [
                            DropdownMenuEntry(
                              value: AppStrings.aaPerson,
                              label: AppStrings.aaPerson,
                            ),
                            DropdownMenuEntry(
                              value: AppStrings.aPerson,
                              label: AppStrings.aPerson,
                            ),
                            DropdownMenuEntry(
                              value: AppStrings.bbPerson,
                              label: AppStrings.bbPerson,
                            ),
                            DropdownMenuEntry(
                              value: AppStrings.bPerson,
                              label: AppStrings.bPerson,
                            ),
                            DropdownMenuEntry(
                              value: AppStrings.ooPerson,
                              label: AppStrings.ooPerson,
                            ),
                            DropdownMenuEntry(
                              value: AppStrings.oPerson,
                              label: AppStrings.oPerson,
                            ),
                            DropdownMenuEntry(
                              value: AppStrings.ababPerson,
                              label: AppStrings.ababPerson,
                            ),
                            DropdownMenuEntry(
                              value: AppStrings.abPerson,
                              label: AppStrings.abPerson,
                            ),
                          ],
                          onSelected: (blood) {},
                          label: Text(
                            AppStrings.bloodPerson,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(left: AppPadding.p12),
                          child:CustomDropDownMenu(
                            controller: _statusController,
                            width: MediaQuery.of(context).size.width / 2.08,
                            dropdownMenuEntries:const <DropdownMenuEntry<String>>
                            [
                              DropdownMenuEntry(
                                value: AppStrings.missingPerson,
                                label: AppStrings.missingPerson,
                              ),
                              DropdownMenuEntry(
                                value: AppStrings.crimePerson,
                                label: AppStrings.crimePerson,
                              ),
                              DropdownMenuEntry(
                                value: AppStrings.disasterPerson,
                                label: AppStrings.disasterPerson,
                              ),
                              DropdownMenuEntry(
                                value: AppStrings.acknowledgedPerson,
                                label: AppStrings.acknowledgedPerson,
                              ),
                            ],
                            onSelected: (status) {},
                            label: Text(
                              AppStrings.statusPerson,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: AppSize.s25,
                ),
                CustomeTextField(
                    keyboardType:TextInputType.text ,
                    controller: _descriptionController,
                    hintText: AppStrings.descriptionPerson,
                    labelText: AppStrings.descriptionPerson,
                    maxLines: 3,
                ),
                const SizedBox(
                  height: AppSize.s25,
                ),
                CustomeTextField(
                  keyboardType: TextInputType.text,
                  controller: _dnaController,
                  hintText: AppStrings.dnaPerson,
                  labelText: AppStrings.dnaPerson,
                  maxLines: 6,
                ),
                const SizedBox(
                  height: AppSize.s25,
                ),
                SizedBox(
                  width: double.infinity,
                  height: AppSize.s40,
                  child: CustomeElevatedButton(
                      onPressed: (){},
                      textButton: AppStrings.addPerson
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onTapFunction({required BuildContext context}) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      lastDate: DateTime.now(),
      firstDate: DateTime(1990),
      initialDate: DateTime.now(),
    );
    if (pickedDate == null) return;
    _datePickerBirthdayController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
  }
}
