import 'dart:async';

import 'package:advance_flutter/domain/usecase/login_usecase.dart';
import 'package:advance_flutter/presentation/base/base_view_model.dart';
import 'package:advance_flutter/presentation/common/freezed_data_classes.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs, LoginViewModelOutputs {
  StreamController _userNamestreamController =
      StreamController<String>.broadcast();
  StreamController _passwordstreamController =
      StreamController<String>.broadcast();

  StreamController _isAllInputsValidStreamController =
      StreamController<void>.broadcast();

  var loginObject = LoginObject("", "");

  LoginUseCase? _loginUseCase; //Todo remove ?
  LoginViewModel(this._loginUseCase);
  // inputs
  @override
  void dispose() {
    _userNamestreamController.close();
    _passwordstreamController.close();
  }

  @override
  void start() {}

  @override
  Sink get inputPassword => _passwordstreamController.sink;

  @override
  Sink get inputUserName => _userNamestreamController.sink;

  @override
  Sink get inputIsAllInputValid => _isAllInputsValidStreamController.sink;

  @override
  login() async {
    // (await _loginUseCase?.execute(
    //         LoginUseCaseInput(loginObject.userName, loginObject.password)))
    //     ?.fold(
    //         (failure) => {
    //               //Left -> Failure
    //               print(failure.message)
    //             },
    //         (data) => {
    //               //right -> sucess (data)
    //               print(data.customer?.name)
    //             });
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(
        password: password); //data class operation same as kolin
    _validate();
  }

  @override
  setUserName(String userName) {
    inputUserName.add(userName);
    loginObject = loginObject.copyWith(
        userName: userName); //data class operation same as kolin
    _validate();
  }

  // outputs
  @override
  Stream<bool> get outputIsPasswordValid => _passwordstreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outputIsUserNameValid => _userNamestreamController.stream
      .map((userName) => _isUsernameValid(userName));

  @override
  Stream<bool> get outputIsAllInputsValid =>
      _isAllInputsValidStreamController.stream.map((_) => _isAllInputsValid());

  _validate() {
    inputIsAllInputValid.add(null);
  }

  //private function
  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  bool _isUsernameValid(String userName) {
    return userName.isNotEmpty;
  }

  bool _isAllInputsValid() {
    return _isPasswordValid(loginObject.password) &&
        _isUsernameValid(loginObject.userName);
  }
}

abstract class LoginViewModelInputs {
  // three functions for actions
  setUserName(String userName);

  setPassword(String password);

  login();

// two sinks for streams
  Sink get inputUserName;

  Sink get inputPassword;

  Sink get inputIsAllInputValid;
}

abstract class LoginViewModelOutputs {
  Stream<bool> get outputIsUserNameValid;

  Stream<bool> get outputIsPasswordValid;

  Stream<bool> get outputIsAllInputsValid;
}
