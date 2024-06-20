
import 'dart:async';

import 'package:double_helix_detective_system/domain/usecase/login_usecase.dart';
import 'package:double_helix_detective_system/presentation/base/base_view_model.dart';
import 'package:double_helix_detective_system/presentation/common/freezed_data_class.dart';

import '../../../../app/app_prefs.dart';
import '../../../../app/di.dart';
import '../../../common/state_renderer/state_renderer.dart';
import '../../../common/state_renderer/state_renderer_imp.dart';

class LoginViewModel extends BaseViewModel with
    LoginViewModelInput , LoginViewModelOutput
{

  final StreamController _emailStreamController = StreamController<String>.broadcast();
  final StreamController _passwordStreamController = StreamController<String>.broadcast();
  final StreamController _outAllInputValidStreamController = StreamController<void>.broadcast();
  final AppPreferences _appPreferences = instance<AppPreferences>();

  // stream for navigator
  StreamController isUserLoggedSuccessfullyStreamController = StreamController<bool>();

  // inputs **********************

  @override
  void dispose() {
    super.dispose();
    _passwordStreamController.close();
    _emailStreamController.close();
    _outAllInputValidStreamController.close();
    isUserLoggedSuccessfullyStreamController.close();
  }

  @override
  void start() {
    inputState.add(ContentState());
  }

  final LoginUseCase _loginUseCase;
  LoginViewModel(this._loginUseCase);
  var loginObject = LoginObject(email: "", password: "");
  @override
  login() async{
    inputState.add(LoadingState( StateRendererType.popupLoadingState));
    (await _loginUseCase.execute(LoginUseCaseInput(loginObject.email, loginObject.password)))
        .fold((failure) =>{
      inputState.add(ErrorState(StateRendererType.popupErrorState, failure.message))
    }, (data) {
      inputState.add(ContentState());
      int time = int.parse(data.expiresIn);
      DateTime expiry = DateTime.now().add(Duration(hours: time));
      _appPreferences.setUserLoggedIn(data.token ,expiry);
    isUserLoggedSuccessfullyStreamController.add(true);
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