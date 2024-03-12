import 'package:double_helix_detective_system/presentation/resource/assets_manager.dart';
import 'package:double_helix_detective_system/presentation/resource/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../resource/color_manager.dart';
import '../../resource/font_manager.dart';
import '../../resource/strings_manager.dart';
import '../../resource/style_manager.dart';
import '../../resource/values_manager.dart';

enum StateRendererType {

  // POPUP STATES (DIALOGS)
  popupLoadingState ,
  popupErrorState ,

  // general state
  contentState ,

}
class StateRenderer extends StatelessWidget {
  const StateRenderer({
    required this.stateRendererType,
    this.message = AppStrings.loading,
    this.title = AppStrings.title,
    required this.retryActionFunction,
    super.key
  });

  final StateRendererType stateRendererType;

  final String message;

  final String title;

  final Function retryActionFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _getStateWidget(context),
    );
  }

  Widget _getStateWidget(BuildContext context){
    switch(stateRendererType){

      case StateRendererType.popupLoadingState:
        return _getPopupDialog(context,
            [
              _getAnimatedImage(LottiAssets.loading),
            ]
        );

      case StateRendererType.popupErrorState:
        return _getPopupDialog(context,
            [
              _getAnimatedImage(LottiAssets.error),
              _getMessage(message),
              _getRetryButton(AppStrings.ok, context),
            ]
        );

      case StateRendererType.contentState:
        return Container();
      default:
        return Container();
    }
  }

  Widget _getPopupDialog(BuildContext context , List<Widget> children){
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s20),
      ),
      elevation: AppSize.s1_5,
      backgroundColor: Colors.transparent,
      child: Container(
        width: AppSize.s400,
        decoration: BoxDecoration(
            color: ColorManager.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(AppSize.s20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
              ),
            ]
        ),
        child: _getDialogContent(context , children),
      ),
    );
  }

  Widget _getDialogContent(BuildContext context , List<Widget> children){
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getAnimatedImage(String animationName){
    return SizedBox(
      height: AppSize.s200,
      width: AppSize.s200,
      child: Lottie.asset(
        animationName ,
      ),
    );
  }

  Widget _getMessage(String message){
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: Text(
          message ,
          style: getRegularStyle(
            color: ColorManager.title,
            fontSize: FontSize.s18,
          ),
        ),
      ),
    );
  }

  Widget _getRetryButton(String buttonTitle , BuildContext context){
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p18),
        child: SizedBox(
          width: AppSize.s300,
          child: ElevatedButton(
            onPressed: ()
            {
              // popup error
                Navigator.pushNamed(context, RoutesManager.loginRoute);
            },
            child: Text(
                buttonTitle
            ),
          ),
        ),
      ),
    );
  }
}


