import 'package:double_helix_detective_system/domain/models/models.dart';
import 'package:double_helix_detective_system/presentation/resource/values_manager.dart';
import 'package:double_helix_detective_system/presentation/screens/missing_persons/viewModel/missing_form_view_model.dart';
import 'package:double_helix_detective_system/presentation/widget/card_show_person_info.dart';
import 'package:double_helix_detective_system/presentation/widget/custom_actions_buttons.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../app/di.dart';
import '../../../common/state_renderer/state_renderer_imp.dart';
import '../../../resource/color_manager.dart';
import '../../../resource/font_manager.dart';
import '../../../resource/routes_manager.dart';
import '../../../resource/strings_manager.dart';

class MissingResult extends StatefulWidget {
  const MissingResult({super.key});

  @override
  State<MissingResult> createState() => _MissingResultState();
}

class _MissingResultState extends State<MissingResult> {

  late MissingSearchViewModel _missingSearchViewModel ;

  @override
  void initState() {
    _missingSearchViewModel = instance<MissingSearchViewModel>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.lightBackground,
      appBar: AppBar(
        title: const Text(AppStrings.missingResult),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_outlined),
          onPressed: () {
            _missingSearchViewModel.clearData();
            Navigator.pop(context);
          },
        ),
      ),
      body: StreamBuilder<FlowState>(
          stream: _missingSearchViewModel.outState,
          builder: (context, snapshot) {
            return snapshot.data?.getScreenWidget(context, _getContentView(),
                    () {
                  _missingSearchViewModel.missingSearch();
                }) ??
                _getContentView();
          }),
    );
  }

  Widget _getContentView() {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Text(
                    'Missing Person Info',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeightManager.semiBold,
                        ),
                  ),
                  const SizedBox(
                    height: AppSize.s16,
                  ),
                  _getMissingPerson(),
                  const SizedBox(
                    height: AppSize.s20,
                  ),
                  Text(
                    'Missing Relative Info',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeightManager.semiBold,
                        ),
                  ),
                  const SizedBox(
                    height: AppSize.s16,
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: _getMissingRelative(),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: AppSize.s40,
              ),
            )
          ],
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            color: ColorManager.lightBackground,
            padding:const  EdgeInsets.all(AppPadding.p14),
            child: CustomActionsButtons(onPressed: (){
              _missingSearchViewModel.clearData();
              Navigator.of(context).pushNamedAndRemoveUntil(
                  RoutesManager.servicesPresentedRoute,
                      (route) => false
              );
            },),
          ),
        )
      ],
    );
  }

  // stream builder of missing person
  Widget _getMissingPerson() {
    return StreamBuilder<AllMissingSearchResult>(
        stream: _missingSearchViewModel.allMissingSearchResultOutput,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasData) {
            return _getMissingPersonInfo(snapshot.data);
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return const Text('No Data Available');
          }
        });
  }

  // missing person info
  Widget _getMissingPersonInfo(AllMissingSearchResult? allMissingSearchResult) {
    if (allMissingSearchResult != null && allMissingSearchResult.missingPersonInfo!.birthDate != DateTime(0)) {

        String birthDate = DateFormat('yyyy-MM-dd').format(allMissingSearchResult.missingPersonInfo!.birthDate);
        return CustomCardShowPersonInfo(
          backgroundColor: ColorManager.backgroundCard,
          name: allMissingSearchResult.missingPersonInfo!.name,
          address: allMissingSearchResult.missingPersonInfo!.address,
          phone: allMissingSearchResult.missingPersonInfo!.phone,
          nationalId: allMissingSearchResult.missingPersonInfo!.nationalId,
          gender: allMissingSearchResult.missingPersonInfo!.gender,
          bloodType: allMissingSearchResult.missingPersonInfo!.bloodType,
          birthDate: birthDate,
          status: allMissingSearchResult.missingPersonInfo!.status,
          description: allMissingSearchResult.missingPersonInfo!.description,
        );

    } else {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: AppMargin.m100),
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
          border: Border.all(
              color: ColorManager.gray,
              width: AppSize.s2
          ),
        ),
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Text(
          'No Data Found' ,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      );
    }
  }

  // stream builder of missing relative
  Widget _getMissingRelative() {
    return StreamBuilder<List<MissingRelativeInfo>>(
        stream: _missingSearchViewModel.missingRelativeOutput,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasData) {
            return _getMissingRelativeInfo(snapshot.data);
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return const Text('No Data Available');
          }
        });
  }

  // missing relative info
  Widget _getMissingRelativeInfo(List<MissingRelativeInfo>? missingRelatives) {
    if (missingRelatives!.isNotEmpty) {
      return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: missingRelatives
            .map((relative) => Padding(
                  padding: const EdgeInsets.only(bottom: AppPadding.p20),
                  child: CustomCardShowPersonInfo(
                      name: relative.personInfo!.name,
                      address: relative.personInfo!.address,
                      phone: relative.personInfo!.phone,
                      nationalId: relative.personInfo!.nationalId,
                      gender: relative.personInfo!.gender,
                      bloodType: relative.personInfo!.bloodType,
                      birthDate: DateFormat('yyyy-MM-dd').format(relative.personInfo!.birthDate),
                      status: relative.personInfo!.status,
                      description: relative.personInfo!.description),
                ))
            .toList(),
      );
    } else {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: AppMargin.m100),
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
          border: Border.all(
              color: ColorManager.gray,
              width: AppSize.s2
          ),
        ),
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Text(
          'No Relative Found' ,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      );
    }
  }

  @override
  void dispose() {
    Future.microtask(() => _missingSearchViewModel.clearData());
    super.dispose();
  }
}
