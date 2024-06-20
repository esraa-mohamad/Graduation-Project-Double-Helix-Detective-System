import 'dart:async';

import '../common/state_renderer/state_renderer_imp.dart';

abstract class BaseViewModel extends BaseViewModelInputs with BaseViewModelOutputs{
  final StreamController _inputStreamController = StreamController<FlowState>.broadcast();
  @override
  Sink get inputState => _inputStreamController.sink;
  @override
  Stream<FlowState> get outState => _inputStreamController.stream.map((flowState) => flowState);
  @override
  void dispose() {
    _inputStreamController.close();
  }
}
abstract class BaseViewModelInputs{
  void start();
  void dispose();
  Sink get inputState ;
}
mixin BaseViewModelOutputs{
  Stream<FlowState> get outState;
}
