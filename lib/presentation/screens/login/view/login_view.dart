import 'package:double_helix_detective_system/presentation/resource/assets_manager.dart';
import 'package:double_helix_detective_system/presentation/resource/routes_manager.dart';
import 'package:double_helix_detective_system/presentation/resource/values_manager.dart';
import 'package:double_helix_detective_system/presentation/screens/login/viewModel/login_viewmodel.dart';
import 'package:double_helix_detective_system/presentation/widget/elevated_button.dart';
import 'package:double_helix_detective_system/presentation/widget/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../../../app/app_prefs.dart';
import '../../../../app/di.dart';
import '../../../common/state_renderer/state_renderer_imp.dart';
import '../../../resource/strings_manager.dart';
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginViewModel _loginViewModel = instance<LoginViewModel>();
  final _formKey = GlobalKey<FormState>();
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
   bool _visiblePassword = false;
  _bind(){
    _loginViewModel.start();
    _emailController.addListener(() => _loginViewModel.setEmail(_emailController.text));
    _passwordController.addListener(() => _loginViewModel.setPassword(_passwordController.text));
    _loginViewModel.isUserLoggedSuccessfullyStreamController.stream.listen((isLoggedIn)
    {
      if(isLoggedIn){
        SchedulerBinding.instance.addPostFrameCallback((_)
        {
          _appPreferences.getAuthToken();
          Navigator.of(context).pushReplacementNamed(RoutesManager.servicesPresentedRoute);
        });
      }
    });
  }
  @override
  void initState() {
    _bind();
    super.initState();
    _visiblePassword=true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<FlowState>(
        stream: _loginViewModel.outState,
        builder: (context , snapshot){
          return snapshot.data?.getScreenWidget(context , _loginViewContent(), (){
            _loginViewModel.login();
          }) ??
              _loginViewContent() ;
        },
      ),
    );
  }


  Widget _loginViewContent(){
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsImageManager.backgroundLogin),
          fit: BoxFit.cover,

        ),
      ),
      child: Center(
        child: SizedBox(
          width: AppSize.s500,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p18),
              child: SingleChildScrollView(
                child: Center(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Text(
                          AppStrings.login,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(
                          height: AppSize.s40,
                        ),
                        StreamBuilder<bool>(
                            stream: _loginViewModel.outIsEmailValid,
                            builder: (context , snapshot){
                              return  CustomeTextField(
                                keyboardType: TextInputType.emailAddress,
                                controller: _emailController,
                                suffixIcon: const Icon(
                                    Icons.alternate_email
                                ),
                                hintText: AppStrings.email,
                                labelText: AppStrings.email,
                                errorText: (snapshot.data ?? true)
                                    ? null
                                    : AppStrings.emailError,
                              );
                            }
                        ),
                        const SizedBox(
                          height: AppSize.s40,
                        ),
                        StreamBuilder<bool>(
                            stream: _loginViewModel.outIsPasswordValid,
                            builder: (context , snapshot){
                              return CustomeTextField(
                                keyboardType: TextInputType.visiblePassword,
                                controller: _passwordController,
                                obscureText: _visiblePassword,
                                suffixIcon:IconButton(
                                  icon: Icon(_visiblePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                  onPressed: () {
                                    setState(
                                          () {
                                        _visiblePassword = !_visiblePassword;
                                      },
                                    );
                                  },
                                ),
                                hintText: AppStrings.password,
                                labelText: AppStrings.password,
                                errorText: (snapshot.data ?? true)
                                    ? null
                                    : AppStrings.passwordError,
                              );
                            }
                        ),
                        const SizedBox(
                          height: AppSize.s40,
                        ),
                        StreamBuilder(
                            stream: _loginViewModel.outAreAllInputValid,
                            builder: (context , snapshot){
                              return SizedBox(
                                width: double.infinity,
                                height: AppSize.s40,
                                child: CustomeElevatedButton(
                                    onPressed:
                                    (snapshot.data ?? false)
                                        ?(){_loginViewModel.login();}
                                        : null ,
                                    textButton: AppStrings.login
                                ),
                              );
                            }
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


  @override
  void dispose() {
    super.dispose();
    _loginViewModel.dispose();
  }
}
