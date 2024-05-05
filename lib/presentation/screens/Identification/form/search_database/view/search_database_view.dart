import 'package:double_helix_detective_system/presentation/resource/strings_manager.dart';
import 'package:double_helix_detective_system/presentation/widget/drop_down_menu.dart';
import 'package:double_helix_detective_system/presentation/widget/text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../../../resource/color_manager.dart';
import '../../../../../resource/values_manager.dart';
import '../../../../../widget/elevated_button.dart';

class SearchDatabaseFormView extends StatefulWidget {
  const SearchDatabaseFormView({super.key});

  @override
  State<SearchDatabaseFormView> createState() => _SearchDatabaseFormViewState();
}

class _SearchDatabaseFormViewState extends State<SearchDatabaseFormView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _caseController = TextEditingController();
  final TextEditingController _dnaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.lightBackground,
      appBar: AppBar(
        title: const Text(AppStrings.identificationPerson),
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
            // height: AppSize.s450,
            decoration: const BoxDecoration(
                color:ColorManager.background,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(AppSize.s25),
                  bottomLeft: Radius.circular(AppSize.s25),
                ),
                boxShadow:[
                  BoxShadow(
                    color: ColorManager.shadow,
                    blurRadius: 25.0,
                    spreadRadius: 10,
                  )
                ]
            ),
            child: SingleChildScrollView(
              child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: AppSize.s20,
                      ),
                      CustomDropDownMenu(
                        dropdownMenuEntries: const <DropdownMenuEntry<String>>[
                          DropdownMenuEntry(
                              value: AppStrings.crimePerson,
                              label: AppStrings.crimePerson),
                          DropdownMenuEntry(
                              value: AppStrings.disasterPerson,
                              label: AppStrings.disasterPerson),
                        ],
                        onSelected: (state) {},
                        label: Text(
                          AppStrings.caseP,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        controller: _caseController,
                        width: MediaQuery.of(context).size.width*.95,
                      ),
                      const SizedBox(
                        height: AppSize.s20,
                      ),
                      CustomeTextField(
                        hintText: AppStrings.uploadDna,
                        labelText: AppStrings.uploadDna,
                        keyboardType: TextInputType.text,
                        controller: _dnaController,
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
                            textButton: AppStrings.search
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
