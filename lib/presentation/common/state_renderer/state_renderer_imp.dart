import 'package:double_helix_detective_system/presentation/common/state_renderer/state_renderer.dart';
import 'package:flutter/material.dart';

import '../../../app/constants.dart';

abstract class FlowState {
  String getMessage();

  StateRendererType getStateRendererType();
}

class LoadingState extends FlowState {
  StateRendererType stateRendererType;

  LoadingState(this.stateRendererType);

  @override
  String getMessage() => AppConstants.empty;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

class ErrorState extends FlowState {
  StateRendererType stateRendererType;
  String message;

  ErrorState(this.stateRendererType, this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

class ContentState extends FlowState {
  ContentState();

  @override
  String getMessage() => AppConstants.empty;

  @override
  StateRendererType getStateRendererType() => StateRendererType.contentState;
}

extension FlowStateExtension on FlowState {
  Widget getScreenWidget(
      BuildContext context,
      Widget contentScreenWidget,
      Function retryActionFunction
      )
  {
    switch (runtimeType) {
      case LoadingState  :
        {
          if(getStateRendererType()== StateRendererType.popupLoadingState){
            showPopUp(context , getStateRendererType() ,getMessage());
            return contentScreenWidget;
          }else{
            dismissDialog(context);
            return Container();
          }
        }
      case ErrorState  :
        {
          dismissDialog(context);
          if(getStateRendererType()== StateRendererType.popupErrorState){
            showPopUp(context , getStateRendererType() ,getMessage());
            return contentScreenWidget;
          }else{
            return Container();
          }
        }
      case ContentState :
        {
          if (_isCurrentDialogShowing(context)) {
            dismissDialog(context);
          }
          return contentScreenWidget;
        }
      default:
        {
          dismissDialog(context);
          return contentScreenWidget;
        }
    }
  }

  showPopUp(BuildContext context, StateRendererType stateRendererType, String message) {
    print("Showing popup with message: $message"); // Add this line for debugging
    WidgetsBinding.instance.addPostFrameCallback((_) => showDialog(
        context: context,
        useRootNavigator: false,
        barrierDismissible: false, // Prevent dismissing by tapping outside
        builder: (context) => StateRenderer(
              stateRendererType: stateRendererType,
              retryActionFunction: () {
              },
              message: message,
            )));
  }
  _isCurrentDialogShowing(BuildContext context)
  => ModalRoute.of(context)?.isCurrent == true;

  dismissDialog(BuildContext context){
    print("Dismissing dialog"); // Add this line for debugging
    if(_isCurrentDialogShowing(context)){
      Navigator.of(context , rootNavigator: true).pop(true);
    }
  }
}

