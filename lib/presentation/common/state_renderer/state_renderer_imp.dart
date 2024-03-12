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
      context, Widget contentScreenWidget, Function retryActionFunction) {
    switch (runtimeType) {
      case LoadingState:
        {
          //show popup error
          showPopUp(context, getStateRendererType(), getMessage());
          //show content ui
          return contentScreenWidget;
        }
      case ErrorState:
        {
          //show popup error
          showPopUp(context, getStateRendererType(), getMessage());
          //show content ui
          return contentScreenWidget;
        }
      case ContentState:
        {
          return contentScreenWidget;
        }
      default:
        return contentScreenWidget;
    }
  }

  showPopUp(context, StateRendererType stateRendererType, String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) => showDialog(
        context: context,
        builder: (context) => StateRenderer(
              stateRendererType: stateRendererType,
              retryActionFunction: () {},
              message: message,
            )));
  }
}
