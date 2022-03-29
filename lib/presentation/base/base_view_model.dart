abstract class BaseViewModel extends BaseViewModelInputs with BaseViewModelOutputs {
  //shared variables and functions that will be used through and view model
}

abstract class BaseViewModelInputs {
  void start(); //Will be called while init of view model
  void dispose(); //Will be called when viewmodel dies.
}

abstract class BaseViewModelOutputs {}



