import 'package:double_helix_detective_system/presentation/resource/constants_manager.dart';
import 'package:double_helix_detective_system/presentation/resource/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

import '../../../../domain/models/models.dart';
import '../../../resource/assets_manager.dart';
import '../../../resource/color_manager.dart';
import '../../../resource/routes_manager.dart';
import '../../../resource/values_manager.dart';
import '../viewModel/onBoarding_view_model.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _pageController = PageController();
  final OnBoardingViewModel _viewModel = OnBoardingViewModel();
  _bind(){
    _viewModel.start();
  }
  @override
  void initState() {
    _bind();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(stream:_viewModel.outputSliderViewObject, builder:(context,snapshot){
      return _getContentWidget(snapshot.data);
    });
  }
  Widget _getContentWidget(SliderViewObject? sliderViewObject){
    if(sliderViewObject == null){
      return Container();
    }else{
      return Scaffold(
        backgroundColor: ColorManager.lightBackground,
        appBar: AppBar(
          backgroundColor: ColorManager.lightBackground,
          elevation: AppSize.s0 ,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark),
        ),
        body: PageView.builder(
          itemBuilder: (context, index) {
            return OnBoardingPage(sliderViewObject.sliderObject);
          },
          controller: _pageController,
          itemCount: sliderViewObject.numOfSlides,
          onPageChanged: (index) {
            _viewModel.onPageChanged(index);
          },
        ),
        bottomSheet: Container(
          color: ColorManager.lightBackground,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, RoutesManager.servicesPresentedRoute);
                    },
                    child:  Text(
                      AppStrings.skip,
                      textAlign: TextAlign.end,
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyMedium,
                    )),
              ),
              _getBottomSheet(sliderViewObject)
            ],
          ),
        ),
      );
    }
  }

  Widget _getBottomSheet(SliderViewObject  sliderViewObject) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: SvgPicture.asset(AssetsManager.leftArrow),
              ), onTap: () {
              _pageController.animateToPage(_viewModel.goPrevious(),
                  duration: const Duration(
                      milliseconds: AppConstants.sliderAnimationTime),
                  curve: Curves.bounceInOut);
            },
            ),
          ),
          Row(
            children: [
              for(int i = 0; i < sliderViewObject.numOfSlides; i++)
                Padding(padding: const EdgeInsets.all(AppPadding.p8),
                  child: _getProperCircle(i,sliderViewObject.currentIndex),)
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: SvgPicture.asset(AssetsManager.rightArrow),
              ),onTap: (){
              _pageController.animateToPage(_viewModel.goNext(),
                  duration: const Duration(
                      milliseconds: AppConstants.sliderAnimationTime),
                  curve: Curves.bounceInOut);
            },
            ),
          )
        ],
      ),
    );
  }

  Widget _getProperCircle(int index,int currentIndex) {
    if (index == currentIndex) {
      return SvgPicture.asset(AssetsManager.hollowCircle);
    } else {
      return SvgPicture.asset(AssetsManager.solidCircle);
    }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

}
class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage(this._sliderObject, {super.key});
  final SliderObject _sliderObject;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppPadding.p8),
              child: Text(
                _sliderObject.title,
                textAlign: TextAlign.center,
                style: Theme
                    .of(context)
                    .textTheme
                    .displayLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppPadding.p8),
              child: Text(
                _sliderObject.subTitle,
                textAlign: TextAlign.center,
                style: Theme
                    .of(context)
                    .textTheme
                    .headlineLarge,
              ),
            ),
          ],
        ),

        Lottie.asset(_sliderObject.image,height: AppSize.s450,width: AppSize.s450,repeat: true,reverse: false,animate: true),
      ],
    );
  }
}
