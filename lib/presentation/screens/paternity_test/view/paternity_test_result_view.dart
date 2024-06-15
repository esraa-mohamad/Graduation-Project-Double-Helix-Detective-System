import 'package:double_helix_detective_system/domain/models/models.dart';
import 'package:double_helix_detective_system/presentation/resource/assets_manager.dart';
import 'package:double_helix_detective_system/presentation/widget/custom_actions_buttons.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../../app/di.dart';
import '../../../common/state_renderer/state_renderer_imp.dart';
import '../../../resource/color_manager.dart';
import '../../../resource/strings_manager.dart';
import '../../../resource/values_manager.dart';
import '../viewmodel/paternity_test_form_viewmodel.dart';

class PaternityTestResult extends StatefulWidget {
  const PaternityTestResult({super.key});

  @override
  State<PaternityTestResult> createState() => _PaternityTestResultState();
}

class _PaternityTestResultState extends State<PaternityTestResult> {
  final PaternityTestViewModel _paternityTestViewModel =
      instance<PaternityTestViewModel>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.paternityResult),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: StreamBuilder<FlowState>(
          stream: _paternityTestViewModel.outState,
          builder: (context, snapshot) {
            return snapshot.data?.getScreenWidget(context, _getContentView(),
                    () {
                  _paternityTestViewModel.testPaternity();
                }) ??
                _getContentView();
          }),
    );
  }

  Widget _getContentView() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p20),
        child: Container(
          padding: const EdgeInsets.all(AppPadding.p18),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _getCompareResult(),
              const SizedBox(
                height: AppSize.s40,
              ),
              const CustomActionsButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getCompareResult() {
    return StreamBuilder<PaternityTest>(
        stream: _paternityTestViewModel.paternityTestOutput,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading indicator while waiting for data
            return const CircularProgressIndicator();
          } else if (snapshot.hasData) {
            return _getPaternityResultData(snapshot.data);
          } else if (snapshot.hasError) {
            // Handle errors if any
            return Text('Error: ${snapshot.error}');
          } else {
            // Handle the case when there is no data yet
            return const Text('No Data Available');
          }
        });
  }

  Widget _getPaternityResultData(PaternityTest? paternityTest) {
    if (paternityTest != null) {
      return Column(
        children: [
          Lottie.asset(
              paternityTest.prediction == "not relative"
                  ? AssetsLottiManager.homeless
                  : AssetsLottiManager.family,
              height: AppSize.s300,
              width: AppSize.s300,
              repeat: true,
              reverse: false,
              animate: true),
          const SizedBox(
            height: AppSize.s20,
          ),
          RichText(
            text: TextSpan(
              text: "${AppStrings.matchCompare} :- ",
              style: Theme.of(context).textTheme.bodyLarge,
              children: <TextSpan>[
                TextSpan(
                    text: paternityTest.prediction,
                    style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
          ),
          Text(
            paternityTest.prediction == 'not relative'
                ? AppStrings.notFoundFamily
                : AppStrings.findFamily,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  @override
  void dispose() {
    _paternityTestViewModel.dispose();
    super.dispose();
  }
}
