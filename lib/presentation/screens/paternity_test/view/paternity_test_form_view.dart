import 'dart:io';
import 'package:double_helix_detective_system/presentation/resource/routes_manager.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../../../../../app/di.dart';
import 'package:path/path.dart' as path;
import '../../../common/state_renderer/state_renderer_imp.dart';
import '../../../resource/color_manager.dart';
import '../../../resource/strings_manager.dart';
import '../../../resource/values_manager.dart';
import '../../../widget/elevated_button.dart';
import '../../../widget/upload_dna_file.dart';
import '../viewmodel/paternity_test_form_viewmodel.dart';

class PaternityTestForm extends StatefulWidget {
  const PaternityTestForm({super.key});

  @override
  State<PaternityTestForm> createState() => _PaternityTestFormState();
}

class _PaternityTestFormState extends State<PaternityTestForm> {
  final _formKey = GlobalKey<FormState>();
  final PaternityTestViewModel _paternityTestViewModel =
      instance<PaternityTestViewModel>();

  _bind() {
    _paternityTestViewModel.start();
    _paternityTestViewModel
        .isPaternityTestDoneSuccessfullyStreamController.stream
        .listen((isTestedSuccessfully) {
      if (isTestedSuccessfully) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context)
              .pushReplacementNamed(RoutesManager.paternityResultRoute);
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
          AppStrings.paternity.toUpperCase(),
        ),
      ),
      body: StreamBuilder<FlowState>(
        stream: _paternityTestViewModel.outState,
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(context, _getContentWidget(),
                  () {
                _paternityTestViewModel.testPaternity();
              }) ??
              _getContentWidget();
        },
      ),
    );
  }

  Widget _getContentWidget() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p20),
        child: Container(
          padding: const EdgeInsets.all(AppPadding.p20),
          width: double.infinity,
          height: AppSize.s300,
          decoration: const BoxDecoration(
              color: ColorManager.background,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(AppSize.s25),
                bottomLeft: Radius.circular(AppSize.s25),
              ),
              boxShadow: [
                BoxShadow(
                  color: ColorManager.shadow,
                  blurRadius: 25.0,
                  spreadRadius: 10,
                )
              ]),
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                children: [
                  // dna sequence
                  UploadDnaFile(
                      uploadText: AppStrings.uploadChild,
                      child: StreamBuilder<File>(
                        stream: _paternityTestViewModel.fileChildOutput,
                        builder: (context, snapshot) {
                          return _getFilePicker(snapshot.data);
                        },
                      ),
                      onTap: () {
                        _uploadFileChild();
                      }),
                  const SizedBox(
                    height: AppSize.s40,
                  ),
                  UploadDnaFile(
                      uploadText: AppStrings.uploadFather,
                      child: StreamBuilder<File>(
                        stream: _paternityTestViewModel.fileFatherOutput,
                        builder: (context, snapshot) {
                          return _getFilePicker(snapshot.data);
                        },
                      ),
                      onTap: () {
                        _uploadFileFather();
                      }),
                  const SizedBox(
                    height: AppSize.s40,
                  ),
                  // button
                  SizedBox(
                      width: double.infinity,
                      height: AppSize.s40,
                      child: StreamBuilder<bool>(
                          stream: _paternityTestViewModel.areInputsValidOutput,
                          builder: (context, snapshot) {
                            return CustomeElevatedButton(
                                onPressed: (snapshot.data ?? false)
                                    ? () {
                                        _paternityTestViewModel.testPaternity();
                                      }
                                    : null,
                                textButton: AppStrings.paternity);
                          })),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // to add file to container to show it
  Widget _getFilePicker(File? file) {
    if (file != null && file.path.isNotEmpty) {
      return Center(
        child: Row(
          children: [
            const Icon(
              Icons.file_present_rounded,
              color: ColorManager.primary,
              size: AppSize.s25,
            ),
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
    } else {
      return Container();
    }
  }

  // to upload dna at set in vew model
  _uploadFileChild() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowedExtensions: ["txt"],
    );
    if (result != null && result.files.isNotEmpty) {
      // Extract the File object from the result
      var file = File(result.files.single.path!);
      _paternityTestViewModel.setFileChild(file);
    }
  }

  // to upload dna at set in vew model
  _uploadFileFather() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowedExtensions: ["txt"],
    );
    if (result != null && result.files.isNotEmpty) {
      // Extract the File object from the result
      var file = File(result.files.single.path!);
      _paternityTestViewModel.setFileFather(file);
    }
  }

  @override
  void dispose() {
    _paternityTestViewModel.dispose();
    super.dispose();
  }
}
