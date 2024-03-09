import 'package:double_helix_detective_system/presentation/resource/routes_manager.dart';
import 'package:flutter/material.dart';

import '../../../../resource/color_manager.dart';
import '../../../../resource/strings_manager.dart';
import '../../../../resource/values_manager.dart';
import '../../../../widget/elevated_button.dart';
import '../../../../widget/text_form_field.dart';
class PaternityTestForm extends StatefulWidget {
  const PaternityTestForm({super.key});

  @override
  State<PaternityTestForm> createState() => _PaternityTestFormState();
}

class _PaternityTestFormState extends State<PaternityTestForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fatherController = TextEditingController();
  final TextEditingController _childController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.lightBackground,
      appBar: AppBar(
        title: const Text(AppStrings.paternity),
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
                      CustomeTextField(
                        hintText: AppStrings.uploadFather,
                        labelText: AppStrings.uploadFather,
                        keyboardType: TextInputType.text,
                        controller: _fatherController,
                        maxLines: 6,
                      ),
                      const SizedBox(
                        height: AppSize.s20,
                      ),
                      CustomeTextField(
                        hintText: AppStrings.uploadChild,
                        labelText: AppStrings.uploadChild,
                        keyboardType: TextInputType.text,
                        controller: _childController,
                        maxLines: 6,
                      ),
                      const SizedBox(
                        height: AppSize.s25,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: AppSize.s40,
                        child: CustomeElevatedButton(
                            onPressed: (){
                              Navigator.pushNamed(context, RoutesManager.paternityResultRoute);
                            },
                            textButton: AppStrings.test
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
