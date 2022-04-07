import 'dart:async';

import 'package:advance_flutter/presentation/common/state_renderer/state_render_ipml.dart';

abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs {
  StreamController _inputStateStreamController =
      StreamController<FlowState>.broadcast();

  @override
  Sink get inputState => _inputStateStreamController.sink;

  @override
  Stream<FlowState> get outputState =>
      _inputStateStreamController.stream.map((flowState) => flowState);
  @override
  void dispose() {
    _inputStateStreamController.close();
  }
}

abstract class BaseViewModelInputs {
  void start(); // will be called while init. of view model
  void dispose(); // will be called when viewmodel dies.
}

abstract class BaseViewModelOutputs {
  Stream<FlowState> get outputState;
}
