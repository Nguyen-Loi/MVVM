import 'dart:async';

import 'package:advance_flutter/presentation/base/base_view_model.dart';
import 'package:advance_flutter/presentation/common/freezed_data_classes.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs, LoginViewModelOutputs {
  StreamController _userNamestreamController =
      StreamController<String>.broadcast();
  StreamController _passwordstreamController =
      StreamController<String>.broadcast();

  var loginObject = LoginObject("", "");
  // inputs
  @override
  void dispose() {
    _userNamestreamController.close();
    _passwordstreamController.close();
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  // TODO: implement inputPassword
  Sink get inputPassword => _passwordstreamController.sink;

  @override
  // TODO: implement inputUserName
  Sink get inputUserName => _userNamestreamController.sink;

  @override
  login() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(password: password); //data class operation same as kolin

  }

  @override
  setUserName(String userName) {
    inputUserName.add(userName);
    inputPassword.add(userName);
    loginObject = loginObject.copyWith(userName: userName); //data class operation same as kolin
  }

  // outputs
  @override
  // TODO: implement outputIsPasswordValid
  Stream<bool> get outputIsPasswordValid => _passwordstreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  // TODO: implement outputIsUserNameValid
  Stream<bool> get outputIsUserNameValid => _userNamestreamController.stream
      .map((userName) => _isUsernameValid(userName));

  //private function
  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  bool _isUsernameValid(String userName) {
    return userName.isNotEmpty;
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
}

abstract class LoginViewModelOutputs {
  Stream<bool> get outputIsUserNameValid;

  Stream<bool> get outputIsPasswordValid;
}
