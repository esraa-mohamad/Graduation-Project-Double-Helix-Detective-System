
import 'dart:async';

import 'package:double_helix_detective_system/domain/usecase/login_usecase.dart';
import 'package:double_helix_detective_system/presentation/base/base_view_model.dart';
import 'package:double_helix_detective_system/presentation/common/freezed_data_class.dart';

class LoginViewModel extends BaseViewModel with
    LoginViewModelInput , LoginViewModelOutput
{

  final StreamController _emailStreamController = StreamController<String>.broadcast();
  final StreamController _passwordStreamController = StreamController<String>.broadcast();
  final StreamController _outAllInputValidStreamController = StreamController<void>.broadcast();
  final LoginUseCase _loginUseCase;
  LoginViewModel(this._loginUseCase);
  var loginObject = LoginObject(email: "", password: "");

  // inputs **********************

  @override
  void dispose() {
    _passwordStreamController.close();
    _emailStreamController.close();
    _outAllInputValidStreamController.close();
  }

  @override
  void start() {
    // TODO: implement start
  }

  // TODO : using login use case after implement it
  @override
  login() async{
    (await _loginUseCase.execute(LoginUseCaseInput(loginObject.email, loginObject.password)))
        .fold((failure) =>{

    }, (data) =>{
    });
  }


  @override
  setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(password: password);
    inputValid.add(null);
  }

  @override
  setEmail(String email) {
    inputEmail.add(email);
    loginObject = loginObject.copyWith(email: email);
    inputValid.add(null);
  }

  @override
  Sink get inputEmail => _emailStreamController.sink;


  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputValid => _outAllInputValidStreamController.sink;

  // outputs *******************
  @override
  Stream<bool> get outIsEmailValid => _emailStreamController.stream
      .map((email) => _isEmailValid(email));

  @override
  Stream<bool> get outIsPasswordValid => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outAreAllInputValid => _outAllInputValidStreamController.stream.
  map((_) => _areAllValidInput()
  );

  bool _isEmailValid(String email){
    return email.isNotEmpty;
  }

  bool _isPasswordValid(String password){
    return password.isNotEmpty;
  }

  bool _areAllValidInput(){
    return _isEmailValid(loginObject.email)
        && _isPasswordValid(loginObject.password);
  }

}

mixin LoginViewModelInput {
  setEmail(String email);
  setPassword(String password);
  login();

  Sink get inputEmail;
  Sink get inputPassword;
  Sink get inputValid;

}

mixin LoginViewModelOutput {
  Stream<bool> get outIsEmailValid;
  Stream<bool> get outIsPasswordValid;
  Stream<bool> get outAreAllInputValid;
}