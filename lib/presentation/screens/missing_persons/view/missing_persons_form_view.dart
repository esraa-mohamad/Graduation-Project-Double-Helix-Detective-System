import 'dart:io';

import 'package:double_helix_detective_system/presentation/resource/color_manager.dart';
import 'package:double_helix_detective_system/presentation/resource/routes_manager.dart';
import 'package:double_helix_detective_system/presentation/resource/strings_manager.dart';
import 'package:double_helix_detective_system/presentation/resource/values_manager.dart';
import 'package:double_helix_detective_system/presentation/screens/missing_persons/viewModel/missing_form_view_model.dart';
import 'package:double_helix_detective_system/presentation/widget/elevated_button.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:path/path.dart' as path;
import '../../../../app/di.dart';
import '../../../common/state_renderer/state_renderer_imp.dart';
import '../../../widget/upload_dna_file.dart';
class MissingForm extends StatefulWidget {
  const MissingForm({super.key});

  @override
  State<MissingForm> createState() => _MissingFormState();
}

class _MissingFormState extends State<MissingForm> {

  final _formKey = GlobalKey<FormState>();

  late MissingSearchViewModel _missingSearchViewModel;

  _bind(){
    _missingSearchViewModel = instance<MissingSearchViewModel> ();
    _missingSearchViewModel.start();
    _missingSearchViewModel.isSearchMissingSuccessfullyStreamController.stream.listen((isSearchedSuccessfully)
    {
      if(isSearchedSuccessfully){
        SchedulerBinding.instance.addPostFrameCallback((_)
        {
          if(mounted){
            Navigator.of(context).pushNamed(RoutesManager.missingPersonResultRoute);
          }
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
    return  Scaffold(
      backgroundColor: ColorManager.lightBackground,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_outlined),
          onPressed: () {
            _missingSearchViewModel.clearData();
            Navigator.pop(context);
          },
        ),
        title: Text(
          AppStrings.searchMissing.toUpperCase(),
        ),
      ),
      body: StreamBuilder<FlowState>(
        stream: _missingSearchViewModel.outState,
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(context, _getContentWidget(),
                  () {
                _missingSearchViewModel.missingSearch();
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
          padding: const EdgeInsets.all(AppPadding.p20),
          width: double.infinity,
          height: AppSize.s200,
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
            child:  Center(
              child: Column(
                children: [
                  // dna sequence
                  UploadDnaFile(
                      child: StreamBuilder<File>(
                        stream: _missingSearchViewModel.fileOutput,
                        builder: (context,snapshot){
                          return _getFilePicker(snapshot.data);
                        },
                      ),
                      onTap: (){
                        _uploadFile();
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
                          stream: _missingSearchViewModel.allOutputValid,
                          builder: (context , snapshot){
                            return CustomeElevatedButton(
                                onPressed: (snapshot.data ?? false)
                                    ?(){_missingSearchViewModel.missingSearch();}
                                    : null,
                                textButton: AppStrings.compare
                            );
                          }
                      )
                  ),
                ],
              ),
            ),
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
            Expanded(
              child: Text(
                'File Name:${path.basename(file.path)}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      );

    }else {
      return Container();
    }
  }

  // to upload dna at set in vew model
  _uploadFile() async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowedExtensions: ["txt"],
    );
    if (result != null && result.files.isNotEmpty) {
      // Extract the File object from the result
      var file = File(result.files.single.path!);
      _missingSearchViewModel.setFile(file);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
