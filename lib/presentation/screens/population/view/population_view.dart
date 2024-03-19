import 'dart:io';

import 'package:double_helix_detective_system/app/di.dart';
import 'package:double_helix_detective_system/presentation/common/state_renderer/state_renderer_imp.dart';
import 'package:double_helix_detective_system/presentation/resource/color_manager.dart';
import 'package:double_helix_detective_system/presentation/resource/strings_manager.dart';
import 'package:double_helix_detective_system/presentation/resource/values_manager.dart';
import 'package:double_helix_detective_system/presentation/screens/population/viewModel/population_viewmodel.dart';
import 'package:double_helix_detective_system/presentation/widget/elevated_button.dart';
import 'package:double_helix_detective_system/presentation/widget/text_form_field.dart';
import 'package:double_helix_detective_system/presentation/widget/upload_dna_file.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;

import '../../../resource/routes_manager.dart';
import '../../../widget/drop_down_menu.dart';

class PopulationView extends StatefulWidget {
  const PopulationView({super.key});

  @override
  State<PopulationView> createState() => _PopulationViewState();
}

class _PopulationViewState extends State<PopulationView> {

  final _formKey = GlobalKey<FormState>();
  final PopulationViewModel _populationViewModel =
      instance<PopulationViewModel>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _nationalIdController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _datePickerBirthdayController =
      TextEditingController();
  final TextEditingController _bloodController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  _bind() {
    _populationViewModel.start();
    _nameController.addListener(() {
      _populationViewModel.setName(_nameController.text);
    });
    _addressController.addListener(() {
      _populationViewModel.setAddress(_addressController.text);
    });
    _genderController.addListener(() {
      _populationViewModel.setGender(_genderController.text);
    });
    _nationalIdController.addListener(() {
      _populationViewModel.setNationalId(_nationalIdController.text);
    });
    _bloodController.addListener(() {
      _populationViewModel.setBloodType(_bloodController.text);
    });
    _phoneController.addListener(() {
      _populationViewModel.setPhone(_phoneController.text);
    });
    _descriptionController.addListener(() {
      _populationViewModel.setDescription(_descriptionController.text);
    });
    _statusController.addListener(() {
      _populationViewModel.setStatus(_statusController.text);
    });
    _datePickerBirthdayController.addListener(() {
      DateTime selectedDate = DateFormat('yyyy-MM-dd').parse(_datePickerBirthdayController.text);
      _populationViewModel.setBirthDate(selectedDate);
    });
    _populationViewModel.isUserAddedSuccessfullyStreamController.stream.listen((isAddedSuccessfully)
    {
      if(isAddedSuccessfully){
        SchedulerBinding.instance.addPostFrameCallback((_)
        {
          Navigator.of(context).pushReplacementNamed(RoutesManager.servicesPresentedRoute);
        });
      }
    });
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.lightBackground,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          AppStrings.addPopulation.toUpperCase(),
        ),
      ),
      body: StreamBuilder<FlowState>(
        stream: _populationViewModel.outState,
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(context, _getContentWidget(),
                  () {
                _populationViewModel.add();
              }) ??
              _getContentWidget();
        },
      ),
    );
  }

  // widget to show all content of ui
  Widget _getContentWidget() {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p18),
          child: Column(
            children: [
              // name & address
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: AppPadding.p12),
                      child: StreamBuilder<bool>(
                        stream: _populationViewModel.nameOutput,
                        builder: (context , snapshot){
                          return CustomeTextField(
                              keyboardType: TextInputType.text,
                              controller: _nameController,
                              hintText: AppStrings.namePerson,
                              labelText: AppStrings.namePerson
                          );
                        },
                      )
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: AppPadding.p12),
                      child:StreamBuilder<bool>(
                        stream: _populationViewModel.addressOutput,
                        builder: (context , snapshot){
                          return  CustomeTextField(
                              keyboardType: TextInputType.text,
                              controller: _addressController,
                              hintText: AppStrings.addressPerson,
                              labelText: AppStrings.addressPerson);
                        },
                      )
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: AppSize.s25,
              ),

              // national id  & phone
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: AppPadding.p12),
                      child:StreamBuilder<bool>(
                        stream: _populationViewModel.nationalIdOutput,
                        builder: (context , snapshot){
                          return  CustomeTextField(
                            keyboardType: TextInputType.number,
                            controller: _nationalIdController,
                            hintText: AppStrings.nationalIdPerson,
                            labelText: AppStrings.nationalIdPerson,
                          );
                        },
                      )
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: AppPadding.p12),
                      child: StreamBuilder<bool>(
                        stream: _populationViewModel.phoneOutput,
                        builder: (context , snapshot){
                          return CustomeTextField(
                            keyboardType: TextInputType.phone,
                            controller: _phoneController,
                            hintText: AppStrings.phonePerson,
                            labelText: AppStrings.phonePerson,
                            suffixIcon: const Icon(Icons.phone),
                          );
                        },
                      )
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: AppSize.s25,
              ),

              // gender & date
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: AppPadding.p12),
                      child: StreamBuilder<bool>(
                        stream: _populationViewModel.genderOutput,
                        builder: (context , snapshot){
                          return CustomDropDownMenu(
                            controller: _genderController,
                            width: MediaQuery.of(context).size.width / 2.08,
                            dropdownMenuEntries: const <DropdownMenuEntry<String>>[
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
                          );
                        },
                      )
                    ),
                  ),
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.only(left: AppPadding.p12),
                        child: StreamBuilder<DateTime>(
                          stream: _populationViewModel.birthDateOutput,
                          builder: (context , snapshot){
                            return CustomeTextField(
                              keyboardType: TextInputType.datetime,
                              controller: _datePickerBirthdayController,
                              hintText: AppStrings.birthdayPerson,
                              labelText: AppStrings.birthdayPerson,
                              suffixIcon: const Icon(
                                Icons.calendar_month,
                              ),
                              onTap: () => onTapFunction(context: context),
                            );
                          },
                        )
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: AppSize.s25,
              ),

              // blood & status
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: AppPadding.p12),
                      child: StreamBuilder<bool>(
                        stream: _populationViewModel.bloodTypeOutput,
                        builder: (context , snapshot){
                          return CustomDropDownMenu(
                            controller: _bloodController,
                            width: MediaQuery.of(context).size.width / 2.08,
                            dropdownMenuEntries: const <DropdownMenuEntry<String>>[
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
                          );
                        },
                      )
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: AppPadding.p12),
                      child: StreamBuilder<String?>(
                        stream: _populationViewModel.statusErrorOutput,
                        builder: (context,snapshot){
                          return CustomDropDownMenu(
                            controller: _statusController,
                            width: MediaQuery.of(context).size.width / 2.08,
                            dropdownMenuEntries: const <DropdownMenuEntry<String>>[
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
                            errorText: (snapshot.data),
                          );
                        }
                      )
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: AppSize.s25,
              ),

              // description
              StreamBuilder<String?>(
                  stream: _populationViewModel.descriptionErrorOutput,
                  builder: (context , snapshot){
                    return CustomeTextField(
                      keyboardType: TextInputType.text,
                      controller: _descriptionController,
                      hintText: AppStrings.descriptionPerson,
                      labelText: AppStrings.descriptionPerson,
                      maxLines: 3,
                      errorText: (snapshot.data),
                    );
                  }
              ),
              const SizedBox(
                height: AppSize.s25,
              ),

              // dna sequence
              UploadDnaFile(
                  child: StreamBuilder<File>(
                    stream: _populationViewModel.dnaSequenceOutput,
                    builder: (context,snapshot){
                      return _getFilePicker(snapshot.data);
                    },
                  ),
                  onTap: (){
                    _uploadDnaFile();
                  }
              ),
              const SizedBox(
                height: AppSize.s25,
              ),

              // button
              SizedBox(
                width: double.infinity,
                height: AppSize.s40,
                child: StreamBuilder<bool>(
                  stream: _populationViewModel.areInputsValidOutput,
                  builder: (context , snapshot){
                    return CustomeElevatedButton(
                        onPressed: (snapshot.data ?? false)
                            ?(){_populationViewModel.add();}
                            : null,
                        textButton: AppStrings.addPerson
                    );
                  }
                )
              ),
            ],
          ),
        ),
      ),
    );
  }

  // function to open calender to choose date
  onTapFunction({required BuildContext context}) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      lastDate: DateTime.now(),
      firstDate: DateTime(1990),
      initialDate: DateTime.now(),
    );
    if (pickedDate == null) return;
    _datePickerBirthdayController.text =
        DateFormat('yyyy-MM-dd').format(pickedDate);
  }

  // to add file to container to show it
  Widget _getFilePicker(File? file){
    if(file != null && file.path.isNotEmpty){
      // return image
      // return PDFView(
      //   filePath: file.path,
      // );
      return  Center(
        child: Row(
          children: [
            const Icon(Icons.file_present_rounded , color: ColorManager.primary,size: AppSize.s25,),
            Text('File Name:${path.basename(file.path)}'),
          ],
        ),
      );

    }else {
      return Container();
    }
  }

  // to upload dna at set in vew model
   _uploadDnaFile() async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowedExtensions: ["txt"],
    );
    if (result != null && result.files.isNotEmpty) {
      // Extract the File object from the result
      var file = File(result.files.single.path!);
      _populationViewModel.setDnaSeq(file);
      print(_populationViewModel.setDnaSeq(file));
    }
    // if(result == null) return;
    // PlatformFile file = result.files.single;
    // print(file);
    // print(file.path);
  }

  @override
  void dispose() {
    _populationViewModel.dispose();
    super.dispose();
  }
}
