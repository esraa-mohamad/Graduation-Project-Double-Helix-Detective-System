import 'dart:io';

import 'package:double_helix_detective_system/app/di.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:path/path.dart' as path;

import '../../../../common/state_renderer/state_renderer_imp.dart';
import '../../../../resource/color_manager.dart';
import '../../../../resource/routes_manager.dart';
import '../../../../resource/strings_manager.dart';
import '../../../../resource/values_manager.dart';
import '../../../../widget/elevated_button.dart';
import '../../../../widget/upload_dna_file.dart';
import '../viewmodel/compare_dna_viewmodel.dart';
class CompareDnaFormView extends StatefulWidget {
  const CompareDnaFormView({super.key});

  @override
  State<CompareDnaFormView> createState() => _CompareDnaFormViewState();
}

class _CompareDnaFormViewState extends State<CompareDnaFormView> {

  final _formKey = GlobalKey<FormState>();
  final CompareDnaViewModel _compareDnaViewModel = instance<CompareDnaViewModel>();

  _bind(){
    _compareDnaViewModel.start();
    _compareDnaViewModel.isComparedDnaSuccessfullyStreamController.stream.listen((isAddedSuccessfully)
    {
      if(isAddedSuccessfully){
        SchedulerBinding.instance.addPostFrameCallback((_)
        {
          Navigator.of(context).pushReplacementNamed(RoutesManager.compareDnaResultRoute);
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
          AppStrings.compare.toUpperCase(),
        ),
      ),
      body: StreamBuilder<FlowState>(
        stream: _compareDnaViewModel.outState,
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(context, _getContentWidget(),
                  () {
                _compareDnaViewModel.compareDna();
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
          height: AppSize.s300,
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
                        stream: _compareDnaViewModel.fileAOutput,
                        builder: (context,snapshot){
                          return _getFilePicker(snapshot.data);
                        },
                      ),
                      onTap: (){
                        _uploadFileA();
                      }
                  ),
                  const SizedBox(
                    height: AppSize.s40,
                  ),
                  UploadDnaFile(
                      child: StreamBuilder<File>(
                        stream: _compareDnaViewModel.fileBOutput,
                        builder: (context,snapshot){
                          return _getFilePicker(snapshot.data);
                        },
                      ),
                      onTap: (){
                        _uploadFileB();
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
                          stream: _compareDnaViewModel.areInputsValidOutput,
                          builder: (context , snapshot){
                            return CustomeElevatedButton(
                                onPressed: (snapshot.data ?? false)
                                    ?(){_compareDnaViewModel.compareDna();}
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
            Text('File Name:${path.basename(file.path)}'),
          ],
        ),
      );

    }else {
      return Container();
    }
  }

  // to upload dna at set in vew model
  _uploadFileA() async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowedExtensions: ["txt"],
    );
    if (result != null && result.files.isNotEmpty) {
      // Extract the File object from the result
      var file = File(result.files.single.path!);
      _compareDnaViewModel.setFileA(file);
    }
  }

  // to upload dna at set in vew model
  _uploadFileB() async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowedExtensions: ["txt"],
    );
    if (result != null && result.files.isNotEmpty) {
      // Extract the File object from the result
      var file = File(result.files.single.path!);
      _compareDnaViewModel.setFileB(file);
    }
  }

  @override
  void dispose() {
    _compareDnaViewModel.dispose();
    super.dispose();
  }
}
