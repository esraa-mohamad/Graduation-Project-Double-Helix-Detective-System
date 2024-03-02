
import 'dart:async';

import 'package:double_helix_detective_system/presentation/base/base_view_model.dart';
import 'package:double_helix_detective_system/presentation/common/freezed_data_class.dart';

class LoginViewModel extends BaseViewModel with
    LoginViewModelInput , LoginViewModelOutput
{

  final StreamController _emailStreamController = StreamController<String>.broadcast();
  final StreamController _passwordStreamController = StreamController<String>.broadcast();

  var loginObject = LoginObject(email: "", password: "");

  // inputs **********************

  @override
  void dispose() {
    _passwordStreamController.close();
    _emailStreamController.close();
  }

  @override
  void start() {
    // TODO: implement start
  }

  // TODO : using login use case after implement it
  @override
  login() {
    // TODO: implement login
    throw UnimplementedError();
  }


  @override
  setPassword(String password) {
    inputPassword.add(password);
    loginObject.copyWith(password: password);
  }

  @override
  setEmail(String email) {
    inputEmail.add(email);
    loginObject.copyWith(email: email);
  }

  @override
  Sink get inputEmail => _emailStreamController.sink;


  @override
  Sink get inputPassword => _passwordStreamController.sink;


  // outputs *******************
  @override
  Stream<bool> get outIsEmailValid => _emailStreamController.stream
      .map((email) => isEmailValid(email));

  @override
  Stream<bool> get outIsPasswordValid => _passwordStreamController.stream
      .map((password) => isPasswordValid(password));

  bool isEmailValid(String email){
    return email.isNotEmpty;
  }

  bool isPasswordValid(String password){
    return password.isNotEmpty;
  }
}

mixin LoginViewModelInput {
  setEmail(String email);
  setPassword(String password);
  login();

  Sink get inputEmail;
  Sink get inputPassword;

}

mixin LoginViewModelOutput {
  Stream<bool> get outIsEmailValid;
  Stream<bool> get outIsPasswordValid;
}