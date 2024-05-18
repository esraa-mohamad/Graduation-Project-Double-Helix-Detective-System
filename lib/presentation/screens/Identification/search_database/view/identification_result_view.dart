import 'package:double_helix_detective_system/domain/models/models.dart';
import 'package:double_helix_detective_system/presentation/resource/color_manager.dart';
import 'package:flutter/material.dart';

import '../../../../../app/di.dart';
import '../../../../common/state_renderer/state_renderer_imp.dart';
import '../../../../resource/font_manager.dart';
import '../../../../resource/routes_manager.dart';
import '../../../../resource/strings_manager.dart';
import '../../../../resource/values_manager.dart';
import '../../../../widget/elevated_button.dart';
import '../viewmodel/search_database_viewmodel.dart';

class IdentificationResult extends StatefulWidget {
  const IdentificationResult({super.key});

  @override
  State<IdentificationResult> createState() => _IdentificationResultState();
}

class _IdentificationResultState extends State<IdentificationResult> {

  final SearchDatabaseFormViewModel _viewModel = instance<SearchDatabaseFormViewModel>();

  _bind(){
    _viewModel.start();
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
          icon: const Icon(
              Icons.arrow_back_ios_outlined
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: StreamBuilder<FlowState>(
          stream: _viewModel.outState,
          builder: (context , snapshot){
            return snapshot.data?.getScreenWidget(context , _getContentView(), (){
              _viewModel.start();
            }) ??
                _getContentView() ;
          }
      ),
    );
  }

  Widget _getContentView(){
    return Column(
      children: [
        _getSearchMatchResult(),
        const SizedBox(
          height: AppSize.s40,
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

  Widget _getSearchMatchResult(){
    return StreamBuilder<SearchMatchingInfo>(
        stream: _viewModel.searchMatchInfoOutput,
        builder: (context , snapshot){
          print(snapshot.data);
          return _getSearchMatchData(snapshot.data);
        }
    );
  }

  Widget _getSearchMatchData(SearchMatchingInfo? searchMatchingInfo){

    if(searchMatchingInfo !=null){
      print("not empty");
      return Column(
        children: [
          RichText(
            text: TextSpan(
              text: "${AppStrings.similarity} :- ",
              style: Theme.of(context).textTheme.bodyLarge,
              children: <TextSpan>[
                TextSpan(
                    text: '${searchMatchingInfo.similarity} %',
                    style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
          ),
          const SizedBox(
            height: AppSize.s12,
          ),
          RichText(
            text: TextSpan(
              text: "${AppStrings.matchCompare} :- ",
              style: Theme.of(context).textTheme.bodyLarge,
              children: <TextSpan>[
                TextSpan(
                    text: searchMatchingInfo.match,
                    style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
          ),
          const SizedBox(
            height: AppSize.s12,
          ),
           Card(
            child: Column(
              children: [
                // Name : Esraa                   Address : benha
                // Phone : 010                    National Id : 02
                // Gender : female                Blood type : +AB
                // Birth Date : 18/6              Status : eck
                // description :
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "${AppStrings.namePerson} :- ",
                        style: Theme.of(context).textTheme.bodyLarge,
                        children: <TextSpan>[
                          TextSpan(
                              text: searchMatchingInfo.personInfo!.name,
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: "${AppStrings.addressPerson} :- ",
                        style: Theme.of(context).textTheme.bodyLarge,
                        children: <TextSpan>[
                          TextSpan(
                              text: searchMatchingInfo.personInfo!.address,
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: AppSize.s12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "${AppStrings.phonePerson} :- ",
                        style: Theme.of(context).textTheme.bodyLarge,
                        children: <TextSpan>[
                          TextSpan(
                              text: searchMatchingInfo.personInfo!.phone,
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: "${AppStrings.nationalIdPerson} :- ",
                        style: Theme.of(context).textTheme.bodyLarge,
                        children: <TextSpan>[
                          TextSpan(
                              text: searchMatchingInfo.personInfo!.nationalId,
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: AppSize.s12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "${AppStrings.genderPerson} :- ",
                        style: Theme.of(context).textTheme.bodyLarge,
                        children: <TextSpan>[
                          TextSpan(
                              text: searchMatchingInfo.personInfo!.gender,
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: "${AppStrings.bloodPerson} :- ",
                        style: Theme.of(context).textTheme.bodyLarge,
                        children: <TextSpan>[
                          TextSpan(
                              text: searchMatchingInfo.personInfo!.bloodType,
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: AppSize.s12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "${AppStrings.birthdayPerson} :- ",
                        style: Theme.of(context).textTheme.bodyLarge,
                        children: <TextSpan>[
                          TextSpan(
                              text: searchMatchingInfo.personInfo!.birthDate,
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: "${AppStrings.statusPerson} :- ",
                        style: Theme.of(context).textTheme.bodyLarge,
                        children: <TextSpan>[
                          TextSpan(
                              text: searchMatchingInfo.personInfo!.status,
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: AppSize.s12,
                ),
                RichText(
                  text: TextSpan(
                    text: "${AppStrings.descriptionPerson} :- ",
                    style: Theme.of(context).textTheme.bodyLarge,
                    children: <TextSpan>[
                      TextSpan(
                          text: searchMatchingInfo.personInfo!.description,
                          style: Theme.of(context).textTheme.titleMedium),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }else{
      print(" empty");
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
                    text: '${searchMatchingInfo?.similarity} %',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: ColorManager.primary,
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
                    text: searchMatchingInfo?.match,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: ColorManager.primary,
                    )),
              ],
            ),
          ),
          const SizedBox(
            height: AppSize.s12,
          ),
          Padding(
            padding: const EdgeInsets.all(AppSize.s16),
            child: Card(
              child: Column(
                children: [
                  // Name : Esraa                   Address : benha
                  // Phone : 010                    National Id : 02
                  // Gender : female                Blood type : +AB
                  // Birth Date : 18/6              Status : eck
                  // description :
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "${AppStrings.namePerson} :- ",
                          style: Theme.of(context).textTheme.bodyLarge,
                          children: <TextSpan>[
                            TextSpan(
                                text: searchMatchingInfo?.personInfo!.name,
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: "${AppStrings.addressPerson} :- ",
                          style: Theme.of(context).textTheme.bodyLarge,
                          children: <TextSpan>[
                            TextSpan(
                                text: searchMatchingInfo?.personInfo!.address,
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: AppSize.s12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "${AppStrings.phonePerson} :- ",
                          style: Theme.of(context).textTheme.bodyLarge,
                          children: <TextSpan>[
                            TextSpan(
                                text: searchMatchingInfo?.personInfo!.phone,
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: "${AppStrings.nationalIdPerson} :- ",
                          style: Theme.of(context).textTheme.bodyLarge,
                          children: <TextSpan>[
                            TextSpan(
                                text: searchMatchingInfo?.personInfo!.nationalId,
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: AppSize.s12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "${AppStrings.genderPerson} :- ",
                          style: Theme.of(context).textTheme.bodyLarge,
                          children: <TextSpan>[
                            TextSpan(
                                text: searchMatchingInfo?.personInfo!.gender,
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: "${AppStrings.bloodPerson} :- ",
                          style: Theme.of(context).textTheme.bodyLarge,
                          children: <TextSpan>[
                            TextSpan(
                                text: searchMatchingInfo?.personInfo!.bloodType,
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: AppSize.s12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "${AppStrings.birthdayPerson} :- ",
                          style: Theme.of(context).textTheme.bodyLarge,
                          children: <TextSpan>[
                            TextSpan(
                                text: searchMatchingInfo?.personInfo!.birthDate,
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: "${AppStrings.statusPerson} :- ",
                          style: Theme.of(context).textTheme.bodyLarge,
                          children: <TextSpan>[
                            TextSpan(
                                text: searchMatchingInfo?.personInfo!.status,
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: AppSize.s12,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "${AppStrings.descriptionPerson} :- ",
                      style: Theme.of(context).textTheme.bodyLarge,
                      children: <TextSpan>[
                        TextSpan(
                            text: searchMatchingInfo?.personInfo!.description,
                            style: Theme.of(context).textTheme.titleMedium),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
     // return Container();
    }

  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
