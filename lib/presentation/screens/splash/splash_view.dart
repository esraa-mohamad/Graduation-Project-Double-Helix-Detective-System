import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:double_helix_detective_system/presentation/resource/assets_manager.dart';
import 'package:double_helix_detective_system/presentation/resource/color_manager.dart';
import 'package:double_helix_detective_system/presentation/resource/font_manager.dart';
import 'package:double_helix_detective_system/presentation/resource/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../resource/constants_manager.dart';
import '../../resource/routes_manager.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  Timer? _timer ;

  _startDelay(){
    _timer = Timer(
       const Duration(seconds: AppConstants.splashDelay),
      _goNext,
    );
  }

  _goNext(){
    Navigator.pushReplacementNamed(context, RoutesManager.onBoardingRoute);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.lightBackground,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Center(
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: FontSize.s30,
                      color: ColorManager.primary,
                      fontFamily:FontConstants.fontFamily,
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText('Double Helix Detective System'),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Lottie.asset(LottiAssets.splashLogo,
                    repeat: true,
                    reverse: false,
                    animate: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }
}