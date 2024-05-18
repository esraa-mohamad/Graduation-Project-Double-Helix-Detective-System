import 'dart:io';

import 'package:double_helix_detective_system/app/di.dart';
import 'package:double_helix_detective_system/presentation/resource/strings_manager.dart';
import 'package:double_helix_detective_system/presentation/screens/Identification/search_database/viewmodel/search_database_viewmodel.dart';
import 'package:double_helix_detective_system/presentation/widget/drop_down_menu.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:path/path.dart' as path;
import '../../../../common/state_renderer/state_renderer_imp.dart';
import '../../../../resource/color_manager.dart';
import '../../../../resource/routes_manager.dart';
import '../../../../resource/values_manager.dart';
import '../../../../widget/elevated_button.dart';
import '../../../../widget/upload_dna_file.dart';



class SearchDatabaseFormView extends StatefulWidget {
  const SearchDatabaseFormView({super.key});

  @override
  State<SearchDatabaseFormView> createState() => _SearchDatabaseFormViewState();
}

class _SearchDatabaseFormViewState extends State<SearchDatabaseFormView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _statusController = TextEditingController();
  final SearchDatabaseFormViewModel _viewModel=instance<SearchDatabaseFormViewModel>();
  _bind(){
    _viewModel.start();
    _statusController.addListener(() {
      _viewModel.setStatus(_statusController.text);
    });
    _viewModel.isIdentificationSearchSuccessfullyStreamController.stream.listen((isSearchedSuccessfully)
    {
      if(isSearchedSuccessfully){
        SchedulerBinding.instance.addPostFrameCallback((_)
        {
          Navigator.of(context).pushReplacementNamed(RoutesManager.searchResultRoute);
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
          AppStrings.searchDB.toUpperCase(),
        ),
      ),
      body: StreamBuilder<FlowState>(
        stream: _viewModel.outState,
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(context, _getContentWidget(),
                  () {
                _viewModel.identificationSearch();
              }) ??
              _getContentWidget();
        },
      ),
    );
  }
  Widget _getContentWidget(){
    return Center(
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
                    StreamBuilder<String?>(
                      stream: _viewModel.statusErrorOutput,
                      builder: (context, snapshot) {
                        return CustomDropDownMenu(
                          errorText: snapshot.data,
                          dropdownMenuEntries: const <DropdownMenuEntry<String>>[
                            DropdownMenuEntry(
                                value: AppStrings.crimePerson,
                                label: AppStrings.crimePerson),
                            DropdownMenuEntry(
                                value: AppStrings.acknowledgedPerson,
                                label: AppStrings.acknowledgedPerson),
                            DropdownMenuEntry(
                                value: AppStrings.allDb,
                                label: AppStrings.allDb),
                          ],
                          onSelected: (state) {},
                          label: Text(
                            AppStrings.statusPerson,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          controller: _statusController,
                          width: MediaQuery.of(context).size.width*.95,
                        );
                      }
                    ),
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    UploadDnaFile(
                        child: StreamBuilder<File>(
                          stream: _viewModel.fileOutput,
                          builder: (context,snapshot){
                            return _getFilePicker(snapshot.data);
                          },
                        ),
                        onTap: (){
                          _uploadDnaFile();
                        }
                    ),

                    const SizedBox(
                      height: AppSize.s40,
                    ),
                    // button
                    SizedBox(
                        width: double.infinity,
                        height: AppSize.s40,
                        child: StreamBuilder<bool>(
                            stream: _viewModel.areInputsValidOutput,
                            builder: (context , snapshot){
                              return CustomeElevatedButton(
                                  onPressed: (snapshot.data ?? false)
                                      ?(){_viewModel.identificationSearch();}
                                      : null,
                                  textButton: AppStrings.search
                              );
                            }
                        )
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
// to add file to container to show it
  Widget _getFilePicker(File? file){
    if(file != null && file.path.isNotEmpty){
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
      _viewModel.setFile(file);
    }

  }
  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
