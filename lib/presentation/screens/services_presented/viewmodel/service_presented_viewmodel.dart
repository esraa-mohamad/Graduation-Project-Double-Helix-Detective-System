import 'dart:async';

import 'package:double_helix_detective_system/app/app_prefs.dart';
import 'package:double_helix_detective_system/domain/usecase/logout_usecase.dart';
import 'package:double_helix_detective_system/presentation/base/base_view_model.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../app/constants.dart';
import '../../../../app/di.dart';
import '../../../common/state_renderer/state_renderer.dart';
import '../../../common/state_renderer/state_renderer_imp.dart';

class ServicePresentedViewModel extends BaseViewModel with ServicePresentedViewModelInputs,ServicePresentedViewModelOutputs{

  StreamController isUserLogoutStreamController = BehaviorSubject<bool>();
  final LogoutUseCase _logoutUseCase;
  ServicePresentedViewModel(this._logoutUseCase);
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final StreamController<bool> _isHoveredController = BehaviorSubject<bool>();

  @override
  void dispose() {
    super.dispose();
    isUserLogoutStreamController.close();
    _isHoveredController.close();
  }

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  logout() async{
    inputState.add(LoadingState(StateRendererType.popupLoadingState));
    (await _logoutUseCase.execute(LogoutUseCaseInput(
    await _appPreferences.getAuthToken()??AppConstants.empty,
    )))
        .fold(
    (failure) => {
    inputState.add(ErrorState(
    StateRendererType.popupErrorState, failure.message))
    }, (data) {
    inputState.add(ContentState());
    _appPreferences.clearUserData();
    isUserLogoutStreamController.add(true);
    });
  }


  @override
  onEnter() {
    _setHovered.add(true);
  }

  @override
  onExit() {
    _setHovered.add(false);
  }


  @override
  Stream<bool> get isHovered => _isHoveredController.stream;

  Sink<bool> get _setHovered =>_isHoveredController.sink;
}

mixin ServicePresentedViewModelInputs{
  logout();

  onEnter();

  onExit();
}

mixin ServicePresentedViewModelOutputs{
  Stream<bool> get isHovered;
}
