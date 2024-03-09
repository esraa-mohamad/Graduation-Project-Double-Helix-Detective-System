import 'package:double_helix_detective_system/presentation/resource/color_manager.dart';
import 'package:double_helix_detective_system/presentation/resource/routes_manager.dart';
import 'package:double_helix_detective_system/presentation/resource/strings_manager.dart';
import 'package:double_helix_detective_system/presentation/resource/values_manager.dart';
import 'package:double_helix_detective_system/presentation/screens/missing_persons/form/viewModel/missing_form_view_model.dart';
import 'package:double_helix_detective_system/presentation/widget/elevated_button.dart';
import 'package:double_helix_detective_system/presentation/widget/text_form_field.dart';
import 'package:flutter/material.dart';
class MissingForm extends StatefulWidget {
  const MissingForm({super.key});

  @override
  State<MissingForm> createState() => _MissingFormState();
}

class _MissingFormState extends State<MissingForm> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _uploadDnaController = TextEditingController();

  final MissingFormViewModel _missingFormViewModel = MissingFormViewModel();

  _bind(){
    _missingFormViewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
          AppStrings.missing.toUpperCase(),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p20),
          child: Container(
            padding: const EdgeInsets.all(AppPadding.p18),
            width: double.infinity,
            height: AppSize.s450,
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
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    CustomeTextField(
                        controller: _uploadDnaController,
                        keyboardType: TextInputType.text,
                        hintText: AppStrings.uploadDna,
                        labelText: AppStrings.uploadDna,
                        maxLines: 6,
                    ),
                    const SizedBox(
                      height: AppSize.s40,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: AppSize.s40,
                      child: CustomeElevatedButton(
                          onPressed: (){
                            Navigator.pushNamed(context, RoutesManager.missingPersonResultRoute);
                          },
                          textButton: AppStrings.search
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _missingFormViewModel.dispose();
  }
}