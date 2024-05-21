import 'package:double_helix_detective_system/domain/models/models.dart';
import 'package:double_helix_detective_system/presentation/resource/values_manager.dart';
import 'package:double_helix_detective_system/presentation/screens/missing_persons/viewModel/missing_form_view_model.dart';
import 'package:double_helix_detective_system/presentation/widget/card_show_person_info.dart';
import 'package:flutter/material.dart';

import '../../../../app/di.dart';
import '../../../common/state_renderer/state_renderer_imp.dart';
import '../../../resource/color_manager.dart';
import '../../../resource/font_manager.dart';
import '../../../resource/routes_manager.dart';
import '../../../resource/strings_manager.dart';
import '../../../widget/elevated_button.dart';

class MissingResult extends StatefulWidget {
  const MissingResult({super.key});

  @override
  State<MissingResult> createState() => _MissingResultState();
}

class _MissingResultState extends State<MissingResult> {

  final MissingSearchViewModel _missingSearchViewModel = instance<
      MissingSearchViewModel>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.lightBackground,
      appBar: AppBar(
        title: const Text(AppStrings.missingResult),
        leading: IconButton(
          icon: const Icon(
              Icons.arrow_back_ios_outlined
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: StreamBuilder<FlowState>(
          stream: _missingSearchViewModel.outState,
          builder: (context, snapshot) {
            return snapshot.data?.getScreenWidget(
                context, _getContentView(), () {
              _missingSearchViewModel.missingSearch();
            }) ??
                _getContentView();
          }
      ),
    );
  }

  Widget _getContentView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Missing Person Info',
          style: Theme
              .of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(
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
          style: Theme
              .of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(
            fontWeight: FontWeightManager.semiBold,
          ),
        ),
        const SizedBox(
          height: AppSize.s16,
        ),
        _getMissingRelative(),
        const SizedBox(
          height: AppSize.s16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomeElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, RoutesManager.servicesPresentedRoute);
                },
                textButton: AppStrings.backSer),
            CustomeElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutesManager.populationRoute);
                }, textButton: AppStrings.addDB),
          ],
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
        }
    );
  }

  // missing person info
  Widget _getMissingPersonInfo(AllMissingSearchResult? allMissingSearchResult) {
   if(allMissingSearchResult != null){
     return CustomCardShowPersonInfo(
         name: allMissingSearchResult.missingPersonInfo!.name,
         address: allMissingSearchResult.missingPersonInfo!.address,
         phone: allMissingSearchResult.missingPersonInfo!.name,
         nationalId: allMissingSearchResult.missingPersonInfo!.name,
         gender: allMissingSearchResult.missingPersonInfo!.name,
         bloodType: allMissingSearchResult.missingPersonInfo!.name,
         birthDate: allMissingSearchResult.missingPersonInfo!.name,
         status: allMissingSearchResult.missingPersonInfo!.name,
         description: allMissingSearchResult.missingPersonInfo!.name,
     );
   }else
     {
       return Container();
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
        }
    );
  }

  // missing relative info
  Widget _getMissingRelativeInfo(List<MissingRelativeInfo>? missingRelatives) {
    return Container();
  }

  @override
  void dispose() {
    _missingSearchViewModel.dispose();
    super.dispose();
  }
}
