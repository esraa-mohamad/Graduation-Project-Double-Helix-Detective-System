import 'package:double_helix_detective_system/presentation/resource/assets_manager.dart';
import 'package:double_helix_detective_system/presentation/resource/values_manager.dart';
import 'package:double_helix_detective_system/presentation/widget/elevated_button.dart';
import 'package:double_helix_detective_system/presentation/widget/text_form_field.dart';
import 'package:flutter/material.dart';
class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage(ImagesAssets.backgroundLogin),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.6),
              BlendMode.dstIn,
            ),
          ),
        ),
        child: Center(
          child: SizedBox(
            width: AppSize.s500,
            height: AppSize.s400,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p18),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'Login',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      const SizedBox(
                        height: AppSize.s40,
                      ),
                      const CustomeTextField(
                          hintText: 'Email',
                          labelText: 'Email'
                      ),
                      const SizedBox(
                        height: AppSize.s40,
                      ),
                      const CustomeTextField(
                          hintText: 'Password',
                          labelText: 'Password'
                      ),
                      const SizedBox(
                        height: AppSize.s40,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(AppPadding.p12),
                          child: CustomeElevatedButton(
                            onPressed: (){},
                            textButton: 'Login',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
