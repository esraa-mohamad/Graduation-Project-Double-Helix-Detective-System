
import 'package:double_helix_detective_system/presentation/screens/base/base_view_model.dart';

class LoginViewModel extends BaseViewModel with
    LoginViewModelInput , LoginViewModelOutput
{

  // inputs **********************

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  login() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Sink password() {
    // TODO: implement password
    throw UnimplementedError();
  }

  @override
  setPassword(String password) {
    // TODO: implement setPassword
    throw UnimplementedError();
  }

  @override
  setEmail(String userName) {
    // TODO: implement setUserName
    throw UnimplementedError();
  }

  @override
  Sink email() {
    // TODO: implement userName
    throw UnimplementedError();
  }

  // outputs *******************
  @override
  Stream<bool> outIsPasswordValid() {
    // TODO: implement outIsPasswordValid
    throw UnimplementedError();
  }

  @override
  Stream<bool> outIsEmailValid() {
    // TODO: implement outIsUserNameValid
    throw UnimplementedError();
  }


}

mixin LoginViewModelInput {
  setEmail(String userName);
  setPassword(String password);
  login();

  Sink email();
  Sink password();

}

mixin LoginViewModelOutput {
  Stream<bool> outIsEmailValid();
  Stream<bool> outIsPasswordValid();
}