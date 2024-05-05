import 'dart:async';

import 'package:double_helix_detective_system/presentation/base/base_view_model.dart';
import 'package:rxdart/rxdart.dart';

import '../../../common/state_renderer/state_renderer_imp.dart';

class ChooseIdentificationViewModel extends BaseViewModel with ChooseIdentificationViewModelInputs,ChooseIdentificationViewModelOutputs{

  final StreamController<bool> _isHoveredController = BehaviorSubject<bool>();

  @override
  void dispose() {
    super.dispose();
    _isHoveredController.close();
  }

  @override
  void start() {
    inputState.add(ContentState());
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

mixin ChooseIdentificationViewModelInputs{
  onEnter();

  onExit();
}

mixin ChooseIdentificationViewModelOutputs{
  Stream<bool> get isHovered;
}
