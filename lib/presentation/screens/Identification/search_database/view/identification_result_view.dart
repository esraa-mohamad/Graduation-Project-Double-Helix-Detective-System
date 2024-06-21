import 'package:double_helix_detective_system/domain/models/models.dart';
import 'package:double_helix_detective_system/presentation/resource/color_manager.dart';
import 'package:double_helix_detective_system/presentation/widget/card_show_person_info.dart';
import 'package:double_helix_detective_system/presentation/widget/custom_actions_buttons.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../app/di.dart';
import '../../../../common/state_renderer/state_renderer_imp.dart';
import '../../../../resource/font_manager.dart';
import '../../../../resource/routes_manager.dart';
import '../../../../resource/strings_manager.dart';
import '../../../../resource/values_manager.dart';
import '../viewmodel/search_database_viewmodel.dart';

class IdentificationResult extends StatefulWidget {
  const IdentificationResult({super.key});

  @override
  State<IdentificationResult> createState() => _IdentificationResultState();
}

class _IdentificationResultState extends State<IdentificationResult> {
  late SearchDatabaseFormViewModel _viewModel;

  _bind() {
    _viewModel = instance<SearchDatabaseFormViewModel>();
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
        title: const Text(AppStrings.searchResult),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_outlined),
          onPressed: () {
            _viewModel.clearData();
            Navigator.pop(context);
          },
        ),
      ),
      body: StreamBuilder<FlowState>(
          stream: _viewModel.outState,
          builder: (context, snapshot) {
            return snapshot.data?.getScreenWidget(context, _getContentView(),
                    () {
                  _viewModel.identificationSearch();
                }) ??
                _getContentView();
          }),
    );
  }

  Widget _getContentView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _getSearchMatchResult(),
        const SizedBox(
          height: AppSize.s40,
        ),
        CustomActionsButtons(
          onPressedAdd: () {
            _viewModel.clearData();
            Navigator.of(context).pushNamedAndRemoveUntil(
                RoutesManager.populationRoute, (route) => false);
          },
          onPressed: () {
            _viewModel.clearData();
            Navigator.of(context).pushNamedAndRemoveUntil(
                RoutesManager.servicesPresentedRoute, (route) => false);
          },
        ),
      ],
    );
  }

  Widget _getSearchMatchResult() {
    return StreamBuilder<SearchMatchingInfo>(
        stream: _viewModel.searchMatchInfoOutput,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasData) {
            return _getSearchMatchData(snapshot.data);
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return const Text('No Data Available');
          }
        });
  }

  Widget _getSearchMatchData(SearchMatchingInfo? searchMatchingInfo) {
    if (searchMatchingInfo != null) {
      String birthDate = DateFormat('yyyy-MM-dd')
          .format(searchMatchingInfo.personInfo!.birthDate);
      return Column(
        children: [
          RichText(
            text: TextSpan(
              text: "${AppStrings.similarity} :- ",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeightManager.semiBold,
                  ),
              children: <TextSpan>[
                TextSpan(
                    text: '${searchMatchingInfo.similarity} %',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: ColorManager.gray,
                        )),
              ],
            ),
          ),
          const SizedBox(
            height: AppSize.s12,
          ),
          RichText(
            text: TextSpan(
              text: "${AppStrings.matchCompare} :- ",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeightManager.semiBold,
                  ),
              children: <TextSpan>[
                TextSpan(
                    text: searchMatchingInfo.match,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: ColorManager.gray,
                        )),
              ],
            ),
          ),
          const SizedBox(
            height: AppSize.s12,
          ),
          searchMatchingInfo.personInfo != null &&
                  searchMatchingInfo.personInfo!.birthDate != DateTime(0)
              ? CustomCardShowPersonInfo(
                  name: searchMatchingInfo.personInfo!.name,
                  address: searchMatchingInfo.personInfo!.address,
                  phone: searchMatchingInfo.personInfo!.phone,
                  nationalId: searchMatchingInfo.personInfo!.nationalId,
                  gender: searchMatchingInfo.personInfo!.gender,
                  bloodType: searchMatchingInfo.personInfo!.bloodType,
                  birthDate: birthDate,
                  status: searchMatchingInfo.personInfo!.status,
                  description: searchMatchingInfo.personInfo!.description)
              : Container(
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(horizontal: AppMargin.m100),
                  decoration: BoxDecoration(
                    color: ColorManager.background,
                    // Replace with your ColorManager.background
                    borderRadius: BorderRadius.circular(AppSize.s16),
                    boxShadow: const [
                      BoxShadow(
                        color: ColorManager.gray,
                        blurRadius: AppSize.s4,
                        spreadRadius: AppSize.s4,
                      ),
                    ],
                    border:
                        Border.all(color: ColorManager.gray, width: AppSize.s2),
                  ),
                  padding: const EdgeInsets.all(AppPadding.p16),
                  child: Text(
                    'No Data Found',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
        ],
      );
    } else {
      return Container(
        width: double.infinity,
        margin:
        const EdgeInsets.symmetric(horizontal: AppMargin.m100),
        decoration: BoxDecoration(
          color: ColorManager.background,
          // Replace with your ColorManager.background
          borderRadius: BorderRadius.circular(AppSize.s16),
          boxShadow: const [
            BoxShadow(
              color: ColorManager.gray,
              blurRadius: AppSize.s4,
              spreadRadius: AppSize.s4,
            ),
          ],
          border:
          Border.all(color: ColorManager.gray, width: AppSize.s2),
        ),
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Text(
          'No Data Found',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      );
    }
  }

  @override
  void dispose() {
    Future.microtask(() => _viewModel.clearData());
    super.dispose();
  }
}
