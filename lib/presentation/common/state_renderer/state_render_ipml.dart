import 'package:advance_flutter/presentation/common/state_renderer/state_renderer.dart';
import 'package:advance_flutter/presentation/resources/strings_manager.dart';

abstract class FlowState {
  StateRendererType getStateRendererType();
  String getMessage();
}

//Loading state (POPUP, FULL SCREEN)
class LoadingState extends FlowState {
  StateRendererType stateRendererType;
  String message;
  LoadingState({
    required this.stateRendererType,
    String? message,
  }) : message = message ?? AppStrings.loading;

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}
