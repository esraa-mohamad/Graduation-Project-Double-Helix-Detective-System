import 'package:double_helix_detective_system/app/di.dart';
import 'package:double_helix_detective_system/domain/models/models.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


import '../../../../common/state_renderer/state_renderer_imp.dart';
import '../../../../resource/assets_manager.dart';
import '../../../../resource/color_manager.dart';
import '../../../../resource/routes_manager.dart';
import '../../../../resource/strings_manager.dart';
import '../../../../resource/values_manager.dart';
import '../../../../widget/elevated_button.dart';
import '../viewmodel/compare_dna_viewmodel.dart';

class CompareDnaResultView extends StatefulWidget {
  const CompareDnaResultView({super.key});

  @override
  State<CompareDnaResultView> createState() => _CompareDnaResultViewState();
}

class _CompareDnaResultViewState extends State<CompareDnaResultView> {

  final CompareDnaViewModel _viewModel = instance<CompareDnaViewModel>();

  _bind(){
    //_viewModel.start();
  }
  @override
  void initState() {
    _bind();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.comparedResult),
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
              _viewModel.compareDna();
            }) ??
                _getContentView() ;
          }
      ),
    );
  }

  Widget _getContentView(){
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
              Lottie.asset(AssetsManager.family,
                  height: AppSize.s300,
                  width: AppSize.s300,
                  repeat: true,
                  reverse: false,
                  animate: true),
              const SizedBox(
                height: AppSize.s20,
              ),
              _getCompareResult(),
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
          ),
        ),
      ),
    );
  }

  Widget _getCompareResult(){
    return StreamBuilder<CompareDna>(
        stream: _viewModel.compareDnaOutput,
        builder: (context , snapshot){
          // print(snapshot.data);
          // return _getCompareDnaData(snapshot.data);
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading indicator while waiting for data
            return const CircularProgressIndicator();
          } else if (snapshot.hasData) {
            return _getCompareDnaData(snapshot.data);
          } else if (snapshot.hasError) {
            // Handle errors if any
            return Text('Error: ${snapshot.error}');
          } else {
            // Handle the case when there is no data yet
            return const Text('No Data Available');
          }
        }
    );
  }

  Widget _getCompareDnaData(CompareDna? compareDna){

    if(compareDna !=null){
      print("not empty");
      return Column(
        children: [
          RichText(
            text: TextSpan(
              text: "${AppStrings.similarity} :- ",
              style: Theme.of(context).textTheme.bodyLarge,
              children: <TextSpan>[
                TextSpan(
                    text: '${compareDna.similarity} %',
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
                    text: compareDna.match,
                    style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
          ),
          Text(
            AppStrings.findFamily,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      );
    }else{
      print(" empty");
      return Container();
    }

  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
